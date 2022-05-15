package com.doan.job.controllers.event;

import com.doan.job.services.EventsReferencesServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class EventController {
    @Autowired
    private EventsReferencesServices eventsReferencesServices;

    @GetMapping("/events")
    public String getListEvent(Model model) {
        model.addAttribute("listEvent", eventsReferencesServices.getALlEventsReferences());
        return "event";
    }
    @GetMapping("/events/details/{id}")
    public String getDetailsEvent(@PathVariable Long id, Model model){
        model.addAttribute("details",eventsReferencesServices.getEventsReferencesById(id));
        return "detailsEvent";
    }
}
