package sigesti

class AreaResponsavelController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [areaResponsavelInstanceList: AreaResponsavel.list(params), areaResponsavelInstanceTotal: AreaResponsavel.count()]
    }

    def create = {
        def areaResponsavelInstance = new AreaResponsavel()
        areaResponsavelInstance.properties = params
        return [areaResponsavelInstance: areaResponsavelInstance]
    }

    def save = {
        def areaResponsavelInstance = new AreaResponsavel(params)
        if (areaResponsavelInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'areaResponsavel.label', default: 'AreaResponsavel'), areaResponsavelInstance.id])}"
            redirect(action: "show", id: areaResponsavelInstance.id)
        }
        else {
            render(view: "create", model: [areaResponsavelInstance: areaResponsavelInstance])
        }
    }

    def show = {
        def areaResponsavelInstance = AreaResponsavel.get(params.id)
        if (!areaResponsavelInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'areaResponsavel.label', default: 'AreaResponsavel'), params.id])}"
            redirect(action: "list")
        }
        else {
            [areaResponsavelInstance: areaResponsavelInstance]
        }
    }

    def edit = {
        def areaResponsavelInstance = AreaResponsavel.get(params.id)
        if (!areaResponsavelInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'areaResponsavel.label', default: 'AreaResponsavel'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [areaResponsavelInstance: areaResponsavelInstance]
        }
    }

    def update = {
        def areaResponsavelInstance = AreaResponsavel.get(params.id)
        if (areaResponsavelInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (areaResponsavelInstance.version > version) {
                    
                    areaResponsavelInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'areaResponsavel.label', default: 'AreaResponsavel')] as Object[], "Another user has updated this AreaResponsavel while you were editing")
                    render(view: "edit", model: [areaResponsavelInstance: areaResponsavelInstance])
                    return
                }
            }
            areaResponsavelInstance.properties = params
            if (!areaResponsavelInstance.hasErrors() && areaResponsavelInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'areaResponsavel.label', default: 'AreaResponsavel'), areaResponsavelInstance.id])}"
                redirect(action: "show", id: areaResponsavelInstance.id)
            }
            else {
                render(view: "edit", model: [areaResponsavelInstance: areaResponsavelInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'areaResponsavel.label', default: 'AreaResponsavel'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def areaResponsavelInstance = AreaResponsavel.get(params.id)
        if (areaResponsavelInstance) {
            try {
                areaResponsavelInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'areaResponsavel.label', default: 'AreaResponsavel'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'areaResponsavel.label', default: 'AreaResponsavel'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'areaResponsavel.label', default: 'AreaResponsavel'), params.id])}"
            redirect(action: "list")
        }
    }
}
