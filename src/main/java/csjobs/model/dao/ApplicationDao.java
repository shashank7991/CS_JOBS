package csjobs.model.dao;

import java.util.List;

import csjobs.model.Application;
import csjobs.model.File;
import csjobs.model.Job;
import csjobs.model.User;

public interface ApplicationDao {

    Application getApplication( Long id );

    Application getApplication( Job job, User applicant );

    Application saveApplication( Application application );
    
    public File uploadCv(File appl);
    public File uploadRS(File appl1);
    public File uploadTS(File appl2);

    List<Application> getApplications(Long id);
}
