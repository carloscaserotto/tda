class PatientsController < ApplicationController
  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def new
    @patient = Patient.new
    @select_OS = [
                  ["ACA SALUD", "aca_salud"], 
                  ["ACCORD SALUD", "accord"], 
                  ["ACTIVA SALUD", "activa"], 
                  ["ALTA SALUD", "alta"], 
                  ["AMIL - PROGRAMA DE SALUD", "amil"], 
                  ["AMIS - ASISTENCIA MÉDICA INTEGRAL DE SALUD", "amis"], 
                  ["ANDAR", "andar"], 
                  ["APSOT", "apsot"], 
                  ["ARROYO PROGRAMAS MÉDICOS", "arroyo"], 
                  ["ASMEPRIV (ASISTIR SALUD)", "asmepriv"], 
                  ["CENTRO MÉDICO PUEYRREDÓN", "puerrredon"], 
                  ["COBER MED", "cobermed"], 
                  ["COLEGIO DE ESCRIBANOS CAPITAL", "escribanos"],
                  ["COMPIR","COMPIR"],
                  ["DOCTHOS S.A.","DOCTHOS S.A."],
                  ["ÉTICA SALUD (OBRA SOCIAL OSCEARA)","ÉTICA SALUD (OBRA SOCIAL OSCEARA)"],
                  ["FEMEDICA","FEMEDICA"],
                  ["FEMÉDICA RED ARGENTINA DE SALUD","FEMÉDICA RED ARGENTINA DE SALUD"],
                  ["FSST","FSST"],
                  ["GALENO","GALENO"],
                  ["INTEGRAR SISTEMA MÉDICO CONSEJO","INTEGRAR SISTEMA MÉDICO CONSEJO"],
                  ["IPROSS OBRA SOCIAL DE LA PROVINCIA DE RIO NEGRO","IPROSS OBRA SOCIAL DE LA PROVINCIA DE RIO NEGRO"],
                  ["JERÁRQUICOS SALUD","JERÁRQUICOS SALUD"],
                  ["LUIS PASTEUR","LUIS PASTEUR"],
                  ["MAGNA SALUD - MGN SALUD","MAGNA SALUD - MGN SALUD"],
                  ["MEDICAL CORPORATIVE TRADE","MEDICAL CORPORATIVE TRADE"],
                  ["MEDICAL'S PROGRAMA DE SALUD","MEDICAL'S PROGRAMA DE SALUD"],
                  ["MEDICUS","MEDICUS"],
                  ["MEDIFE ASOCIACIÓN CIVIL","MEDIFE ASOCIACIÓN CIVIL"],
                  ["MEDIN","MEDIN"],
                  ["MINERVA - PROGRAMA DE SALUD","MINERVA - PROGRAMA DE SALUD"],
                  ["O.S. FUTBOLISTAS ARGENTINOS AGREMIADOS","O.S. FUTBOLISTAS ARGENTINOS AGREMIADOS"],
                  ["OBRA SOCIAL WILLIAM HOPE","OBRA SOCIAL WILLIAM HOPE"],
                  ["OBRA SOCIAL FORD","OBRA SOCIAL FORD"],
                  ["OMA - ORGANIZACIÓN MÉDICA ARGENTINA","OMA - ORGANIZACIÓN MÉDICA ARGENTINA"],
                  ["OMINT","OMINT"],
                  ["OPDEA MED","OPDEA MED"],
                  ["OSDE BINARIO","OSDE BINARIO"],
                  ["OSDE 210","OSDE 210"],
                  ["OSDE 310","OSDE 310"],
                  ["OSDE 410","OSDE 410"],
                  ["OSDE 450","OSDE 510"],
                  ["OSDEPYM","OSDEPYM"],
                  ["OSFATUN","OSFATUN"],
                  ["OSJERA","OSJERA"],
                  ["OSME","OSME"],
                  ["OSMECON OBRA SOCIAL DEL CÍRCULO MÉDICO DE SAN ISIDRO","OSMECON OBRA SOCIAL DEL CÍRCULO MÉDICO DE SAN ISIDRO"],
                  ["OSMISS","OSMISS"],
                  ["OSPE - OBRA SOCIAL DE PETROLEROS","OSPE - OBRA SOCIAL DE PETROLEROS"],
                  ["OSPL - OBRA SOCIAL DEL PERSONAL LADRILLERO","OSPL - OBRA SOCIAL DEL PERSONAL LADRILLERO"],
                  ["OSPM - OBRA SOCIAL DEL PERSONAL MARÍTIMO","OSPM - OBRA SOCIAL DEL PERSONAL MARÍTIMO"],
                  ["PODER JUDICIAL","PODER JUDICIAL"],
                  ["SAN PEDRO ASOCIACIÓN ECLESIÁSTICA","SAN PEDRO ASOCIACIÓN ECLESIÁSTICA"],
                  ["SANCOR SALUD","SANCOR SALUD"],
                  ["SMAI","SMAI"],
                  ["SWISS MEDICAL","SWISS MEDICAL"],
                  ["VALMED","VALMED"],
                 ]
  end
  def create
    #byebug
    
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to @patient
    else
      render 'new'
    end
  end
  def edit
    @patient = Patient.find(params[:id])
  end
  def update
    @patient = Patient.find(params[:id])

    if @patient.update(patient_params)
      redirect_to @patient
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy

    redirect_to patients_path
  end

  def patient_params
    params.require(:patient).permit(:name, :email, :dni, :lastname, :cobertura)
  end
end
