import java.io.*;

/**
 * 优化selinux政策
 */
public class FormatSepolicy {
    public static void main(String[] args) throws IOException, InterruptedException {
//        FormatFileContexts formatFileContexts = new FormatFileContexts("../sepolicy/file_contexts");
//        formatFileContexts.formatFileContexts();
//
//        FormatFilesUtils.formatFiles("../sepolicy", formatFileContexts);

        String path = "/";
        Process process = Runtime.getRuntime().exec("adb shell num=$(ls -l /s 2>/dev/null | wc -l); if [ $num -ge 1 ]; then echo true; else echo false;fi 2>/dev/null");
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(process.getInputStream()));

        // read result
        String s = bufferedReader.readLine();
        System.out.println("result :" + s);
        if (s != null && !s.equals("true")) {
            System.out.println(path + " not found");
        }
        bufferedReader.close();
    }
}