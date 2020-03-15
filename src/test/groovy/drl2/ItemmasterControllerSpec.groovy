package drl2

import grails.test.mixin.*
import spock.lang.*

@TestFor(Item_masterController)
@Mock(Item_master)
class ItemmasterControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null

        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
        assert false, "TODO: Provide a populateValidParams() implementation for this generated test suite"
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.machine_summaryList
            model.machine_summaryCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.machine_summary!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def machine_summary = new Item_master()
            machine_summary.validate()
            controller.save(machine_summary)

        then:"The create view is rendered again with the correct model"
            model.machine_summary!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            machine_summary = new Item_master(params)

            controller.save(machine_summary)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/item_master/show/1'
            controller.flash.message != null
            Item_master.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def machine_summary = new Item_master(params)
            controller.show(machine_summary)

        then:"A model is populated containing the domain instance"
            model.machine_summary == machine_summary
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def machine_summary = new Item_master(params)
            controller.edit(machine_summary)

        then:"A model is populated containing the domain instance"
            model.machine_summary == machine_summary
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/item_master/index'
            flash.message != null

        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def machine_summary = new Item_master()
            machine_summary.validate()
            controller.update(machine_summary)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.machine_summary == machine_summary

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            machine_summary = new Item_master(params).save(flush: true)
            controller.update(machine_summary)

        then:"A redirect is issued to the show action"
            machine_summary != null
            response.redirectedUrl == "/item_master/show/$machine_summary.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/item_master/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def machine_summary = new Item_master(params).save(flush: true)

        then:"It exists"
            Item_master.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(machine_summary)

        then:"The instance is deleted"
            Item_master.count() == 0
            response.redirectedUrl == '/item_master/index'
            flash.message != null
    }
}
