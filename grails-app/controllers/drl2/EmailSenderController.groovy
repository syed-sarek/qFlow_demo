package drl2

class EmailSenderController {

    def index() { }

    def send() {
        def multipartFile = request.getFile('attachment')

        sendMail {
            multipart true
            to params.address
            subject params.subject
            html params.body
            if(multipartFile && !multipartFile.empty) {
                File tmpFile = new File(System.getProperty("java.io.tmpdir") + System.getProperty("file.separator") + multipartFile.getOriginalFilename());
                multipartFile.transferTo(tmpFile);
                attach tmpFile
            }
        }
        flash.message = "Email Sent Successfully"
        redirect action:"index"
    }
}
