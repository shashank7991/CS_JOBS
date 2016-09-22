package csjobs.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;

import javax.persistence.Transient;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import csjobs.model.Application;
//import csjobs.model.File;
import csjobs.model.Degree;
import csjobs.model.Job;
import csjobs.model.User;
import csjobs.model.dao.ApplicationDao;
import csjobs.model.dao.FileDao;
import csjobs.model.dao.JobDao;

@Controller
@SessionAttributes("application")
public class ApplicationControllerS {

	@Autowired
	private JobDao jobDao;

	@Autowired
	private ApplicationDao applicationDao;

	@Autowired
	private FileDao fileDao;

	@Autowired
	private ServletContext context;

	@RequestMapping(value = "/application/apply.html", method = RequestMethod.GET)
	public String apply(@RequestParam Long jobId, HttpSession session,
			ModelMap models) {
		Job job = jobDao.getJob(jobId);
		User applicant = (User) session.getAttribute("authenticatedUser");
		Application application = applicationDao.getApplication(job, applicant);

		if (application != null && application.isSubmitted()) {
			models.put("errorCode", "error.application.submitted");
			return "error";
		}

		if (application == null)
			application = new Application(job, applicant);

		models.put("application", application);
		return "application/apply";
	}

	@RequestMapping(value = "/application/apply.html", method = RequestMethod.POST)
	public String apply(@ModelAttribute Application application,
			SessionStatus sessionStatus) {
		application = applicationDao.saveApplication(application);
		sessionStatus.setComplete();
		return "redirect:addDegree.html?applicationId=" + application.getId();
	}

	@RequestMapping(value = "/application/addDegree.html", method = RequestMethod.GET)
	public String addDegree(@RequestParam Long applicationId, ModelMap models) {
		models.put("application", applicationDao.getApplication(applicationId));
		models.put("degree", new Degree());
		return "application/addDegree";
	}

	@RequestMapping(value = "/application/addDegree.html", method = RequestMethod.POST)
	public String addDegree(@ModelAttribute Application application,
			@ModelAttribute Degree degree, SessionStatus sessionStatus) {
		application.getDegrees().add(degree);
		application = applicationDao.saveApplication(application);
		sessionStatus.setComplete();
		return "redirect:addDegree.html?applicationId=" + application.getId();
	}

	@RequestMapping(value = "/application/uploadfile.html", method = RequestMethod.GET)
	public String uploadFile(@RequestParam Long applicationId, ModelMap models) {
		models.put("applicationId", applicationId);
		models.put("file", new csjobs.model.File());

		return "application/uploadfile";
	}

	private File getfile() {
		String path = context.getRealPath("/WEB-INF/files");
		return new File(path);
	}

	@Transient
	@RequestMapping(value = "/application/uploadfile.html", method = RequestMethod.POST)
	public String uploadFile(@RequestParam Long applicationId,
			@RequestParam MultipartFile cv, ModelMap models,
			csjobs.model.File file, SessionStatus sessionStatus)
			throws IllegalStateException, IOException {

		Application application = applicationDao.getApplication(applicationId);
		System.out.println(cv.getOriginalFilename());

		String append = applicationId.toString();
		String append2 = application.getApplicant().getId().toString();

		file.setName(append.concat(append2).concat(cv.getOriginalFilename()));
		cv.transferTo(new File(getfile(), file.getName()));

		System.out.println("file transfred");

		file.setType(cv.getContentType());
		file.setSize(cv.getSize());
		file.setDate(new Date());
		file.setOwner(application.getApplicant());

		file = applicationDao.uploadCv(file);
		application.setCv(file);

		applicationDao.saveApplication(application);

		System.out.println("application:" + application.getCurrentJobTitle());

		System.out.println("application:"
				+ application.getCurrentJobInstitution());

		sessionStatus.setComplete();
		return "redirect:/application/uploadrstat.html?applicationId="
				+ applicationId;
	}

	@RequestMapping(value = "/application/uploadrstat.html", method = RequestMethod.GET)
	public String uploadr(@RequestParam Long applicationId, ModelMap models) {
		models.put("applicationId", applicationId);
		models.put("file", new csjobs.model.File());

		return "application/uploadrstat";
	}

	@RequestMapping(value = "/application/uploadrstat.html", method = RequestMethod.POST)
	public String uploadr(@RequestParam Long applicationId,
			@RequestParam MultipartFile researchStatement, ModelMap models,
			csjobs.model.File file, SessionStatus sessionStatus)
			throws IllegalStateException, IOException {

		Application application = applicationDao.getApplication(applicationId);
		System.out.println(researchStatement.getOriginalFilename());

		String append = applicationId.toString();
		String append2 = application.getApplicant().getId().toString();

		file.setName(append.concat(append2).concat(
				researchStatement.getOriginalFilename()));
		researchStatement.transferTo(new File(getfile(), file.getName()));

		System.out.println("file transfred");

		file.setDate(new Date());
		file.setName(append.concat(append2).concat(
				researchStatement.getOriginalFilename()));
		file.setOwner(application.getApplicant());
		file.setSize(researchStatement.getSize());
		file.setType(researchStatement.getContentType());

		models.put("application", application);

		file = applicationDao.uploadRS(file);
		application.setResearchStatement(file);

		applicationDao.saveApplication(application);

		System.out.println("application:" + application.getCurrentJobTitle());

		System.out.println("application:"
				+ application.getCurrentJobInstitution());

		sessionStatus.setComplete();
		return "redirect:/application/uploadtstat.html?applicationId="
				+ applicationId;
	}

	@RequestMapping(value = "/application/uploadtstat.html", method = RequestMethod.GET)
	public String uploadt(@RequestParam Long applicationId, ModelMap models) {
		models.put("applicationId", applicationId);
		models.put("file", new csjobs.model.File());

		return "application/uploadtstat";
	}

	@Transient
	@RequestMapping(value = "/application/uploadtstat.html", method = RequestMethod.POST)
	public String uploadt(@RequestParam Long applicationId,

	@RequestParam MultipartFile teachingStatement, ModelMap models,
			csjobs.model.File file, SessionStatus sessionStatus)
			throws IllegalStateException, IOException {

		Application application = applicationDao.getApplication(applicationId);
		System.out.println(teachingStatement.getOriginalFilename());

		String append = applicationId.toString();
		String append2 = application.getApplicant().getId().toString();

		file.setName(append.concat(append2).concat(
				teachingStatement.getOriginalFilename()));
		teachingStatement.transferTo(new File(getfile(), file.getName()));

		System.out.println("file transfred");

		file.setDate(new Date());
		file.setName(append.concat(append2).concat(
				teachingStatement.getOriginalFilename()));
		file.setOwner(application.getApplicant());
		file.setSize(teachingStatement.getSize());
		file.setType(teachingStatement.getContentType());
		file = applicationDao.uploadTS(file);
		application.setTeachingStatement(file);

		applicationDao.saveApplication(application);

		System.out.println("application:" + application.getCurrentJobTitle());

		System.out.println("application:"
				+ application.getCurrentJobInstitution());

		sessionStatus.setComplete();
		return "redirect:/application/view.html?id=" + application.getId();
	}

	@RequestMapping(value = "/application/download.html")
	public String download(HttpSession session, @RequestParam int filenumber,
			@RequestParam Long id, HttpServletResponse response)
			throws IOException {
		Application application = applicationDao.getApplication(id);

		System.out.println("app id = " + application.getId());
		csjobs.model.File file = null;

		if (filenumber == 1) {
			file = application.getCv();
		} else if (filenumber == 2) {
			file = application.getTeachingStatement();
		} else {
			file = application.getResearchStatement();
		}

		response.setContentType(file.getType());
		response.setHeader("Content-Disposition", "attachment; filename="
				+ file.getName());
		FileInputStream in = new FileInputStream(new File(getfile(),
				file.getName()));
		OutputStream out = response.getOutputStream();

		byte buffer[] = new byte[2048];
		int bytesRead;
		while ((bytesRead = in.read(buffer)) > 0)
			out.write(buffer, 0, bytesRead);

		in.close();

		return "redirect:/application/view.html?applicationId="
				+ application.getId();
	}

	@RequestMapping(value = "/application/upload.html", method = RequestMethod.GET)
	public String upload(@RequestParam Long applicationId, ModelMap models) {
		models.put("applicationId", applicationId);
		models.put("file", new csjobs.model.File());

		return "application/upload";
	}

	@Transient
	@RequestMapping(value = "/application/upload.html", method = RequestMethod.POST)
	public String upload(@RequestParam Long applicationId,
			@RequestParam MultipartFile cv,
			@RequestParam MultipartFile teachingStatement,
			@RequestParam MultipartFile researchStatement, ModelMap models,
			@ModelAttribute csjobs.model.File file,@ModelAttribute csjobs.model.File file1,@ModelAttribute csjobs.model.File file2, SessionStatus sessionStatus)
			throws IllegalStateException, IOException {

		Application application = applicationDao.getApplication(applicationId);


		String append = applicationId.toString();
		String append2 = application.getApplicant().getId().toString();

		file.setName(append.concat(append2).concat(cv.getOriginalFilename()));
		cv.transferTo(new File(getfile(), file.getName()));

		file.setType(cv.getContentType());
		file.setSize(cv.getSize());
		file.setDate(new Date());
		file.setOwner(application.getApplicant());

		file = applicationDao.uploadCv(file);
		application.setCv(file);

		
		file1.setName(append.concat(append2).concat(
				researchStatement.getOriginalFilename()));
		researchStatement.transferTo(new File(getfile(), file1.getName()));

		file1.setDate(new Date());
		file1.setOwner(application.getApplicant());
		file1.setSize(researchStatement.getSize());
		file1.setType(researchStatement.getContentType());

		file1 = applicationDao.uploadRS(file1);
		application.setResearchStatement(file1);


		file2.setName(append.concat(append2).concat(
				teachingStatement.getOriginalFilename()));
		teachingStatement.transferTo(new File(getfile(), file2.getName()));
		
		file2.setDate(new Date());
		file2.setOwner(application.getApplicant());
		file2.setSize(teachingStatement.getSize());
		file2.setType(teachingStatement.getContentType());
		file2 = applicationDao.uploadTS(file2);

		application.setTeachingStatement(file2);

		applicationDao.saveApplication(application);
		models.put("application", application);
		sessionStatus.setComplete();

		return "redirect:/application/view.html?id="
				+ application.getId();

	}

}
