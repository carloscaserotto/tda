class InformMailer < ApplicationMailer

    def new_inform_email
        #byebug
        @inform = params[:inform]
        pdf = Prawn::Document.new
        pdf.draw_text "Previa obtencion de muestra basal de H2 espirado, se administraron 25 gr de sustrato diluidos en 240 ml de agua con" , at: [0, 520], size: 10 
        
        #attachments['informe.pdf'] = File.read('http://localhost:3000/inform/pdf')
        attachments['informe.pdf'] = pdf.render
        mail(to: "carlos.caserotto@gmail.com", subject: "You got a new message!")
    end
end
