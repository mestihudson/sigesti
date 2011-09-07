import grails.util.Environment;
import sigesti.AreaResponsavel;
import sigesti.Lotacao;
import sigesti.Usuario;
import sigesti.TipoStatus;

class BootStrap {

    def init = { servletContext ->

		def var_email = "admin@sigesti.com"
    def var_user = Usuario.findByEmail(var_email)
    def var_area = AreaResponsavel.findByDescricao("Suporte")
    def var_lot = Lotacao.findBySigla("DTI")
    def var_tps = TipoStatus.findByDescricao("Aguardando atendimento")


    if(!var_area) {
      var_area = new AreaResponsavel(descricao:"Suporte")
      if(var_area.save(flush: true)) {
        println "\nÁrea Responsável ${var_area} criada com sucesso!"
      }
      else {
        println "\nÁrea Responsável ${var_area} não pôde ser criada!"
      }
    }

    if(!var_lot) {
      var_lot = new Lotacao(nome:"Diretoria de Tecnologia da Informação", sigla:"DTI", telefone:"(63) 3218-2214")
      if(var_lot.save(flush: true)) {
        println "Lotação ${var_lot} criada com sucesso!"
      }
      else {
        println "Lotação ${var_lot} não pôde ser criada!"
      }
    }

    if(!var_tps) {
      var_tps = new TipoStatus(descricao:"Aguardando atendimento")
      if(var_tps.save(flush: true)) {
        println "Tipo de Status ${var_tps} criado com sucesso!"
      }
      else {
        println "Tipo de Status ${var_tps} não pôde ser criado!"
      }
    }

    def var_nome = "Admin"
    def var_senha = "123456"
    def var_data = new Date()
    def var_nivel = "Administrador"
    def var_mat = ""

    if (!var_user) {
      var_user = new Usuario(data_cadastro:var_data, email:var_email, matricula:var_mat, nivel:var_nivel,
        nome:var_nome, senha:var_senha, confirma_senha:var_senha, area_responsavel:var_area, lotacao:var_lot)
      if (var_user.save(flush: true)) {
        println "Usuário ${var_user} criado com sucesso!"
      }
      else {
        println "Usuário ${var_user} não pôde ser criado!"
      }
    }

  }

  def destroy = {
  }
}
