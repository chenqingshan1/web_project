package web_test;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import ch.ethz.ssh2.ChannelCondition;
import ch.ethz.ssh2.Connection;
import ch.ethz.ssh2.Session;
import ch.ethz.ssh2.StreamGobbler;

public class RmtShellExecutor {

    private static final Logger LOG = LoggerFactory.getLogger(RmtShellExecutor.class);

    private Connection conn;
    private String ip;
    private String usr;
    private String psword;
    private String charset = Charset.defaultCharset().toString();

    private static final int TIME_OUT = 1000 * 5 * 60;

    public RmtShellExecutor(String ip, String usr, String ps) {
        this.ip = ip;
        this.usr = usr;
        this.psword = ps;
    }

    private boolean login() throws IOException {
        conn = new Connection(ip);
        conn.connect();
        return conn.authenticateWithPassword(usr, psword);
    }

    public String exec(String cmds) throws IOException {
        InputStream stdOut = null;
        InputStream stdErr = null;
        String outStr = "";
        String outErr = "";
        int ret = -1;

        try {
            if (login()) {
                Session session = conn.openSession();
                session.execCommand(cmds);
                stdOut = new StreamGobbler(session.getStdout());
                outStr = processStream(stdOut, charset);
                LOG.info("caijl:[INFO] outStr=" + outStr);
                stdErr = new StreamGobbler(session.getStderr());
                outErr = processStream(stdErr, charset);
                LOG.info("caijl:[INFO] outErr=" + outErr);
                session.waitForCondition(ChannelCondition.EXIT_STATUS, TIME_OUT);
                ret = session.getExitStatus();

            } else {
                LOG.error("caijl:[INFO] ssh2 login failure:" + ip);
                throw new IOException("SSH2_ERR");
            }

        } finally {
            if (conn != null) {
                conn.close();
            }
            if (stdOut != null)
                stdOut.close();
            if (stdErr != null)
                stdErr.close();
        }

        return outStr;
    }

    private String processStream(InputStream in, String charset) throws IOException {
        byte[] buf = new byte[1024];
        StringBuilder sb = new StringBuilder();
        while (in.read(buf) != -1) {
            sb.append(new String(buf, charset));
        }
        return sb.toString();
    }

//    public static void main(String[] args) {
//
//        String usr = "chenqingyun";
//        String password = "chenqingyun";
//        String serverIP = "192.168.1.166";
//        String shPath = "/data1/tomcat4bossmcs/logs/mcp/boss_info.log";
//
//        RmtShellExecutor exe = new RmtShellExecutor(serverIP, usr, password);
//
//        String outInf;
//
//        try {
//            //outInf = exe.exec("sh " + shPath + " xn");
//        	outInf = exe.exec("grep 'activeCode' " +shPath+" | grep 14000002102");
//            System.out.println("outInf= " + outInf);
//            
//			//String b=outInf.substring(outInf.lastIndexOf("="), outInf.length());
//            int index = outInf.indexOf("=") ; //获取出现key字符串的第一个位置，这里要保证前面没有跟KEY重复
//            // String left = s.substring(index) 截取KEY出现位置前面的字符串
//                String b = outInf.substring(index+1,index+5) ;
//			  System.out.println(b);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }

}