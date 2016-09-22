package csjobs.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import csjobs.model.Application;
import csjobs.model.File;
import csjobs.model.Job;
import csjobs.model.User;
import csjobs.model.dao.ApplicationDao;

@Repository
public class ApplicationDaoImpl implements ApplicationDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public Application getApplication(Long id) {
		return entityManager.find(Application.class, id);
	}

	@Override
	public Application getApplication(Job job, User applicant) {
		String query = "from Application where job = :job and applicant = :applicant";

		List<Application> results = entityManager
				.createQuery(query, Application.class).setParameter("job", job)
				.setParameter("applicant", applicant).getResultList();
		return results.size() == 0 ? null : results.get(0);
	}

	@Override
	@Transactional
	public Application saveApplication(Application application) {
		return entityManager.merge(application);
	}

	@Override
	@Transactional
	public File uploadCv(File appl) {
		return entityManager.merge(appl);
	}

	@Override
	@Transactional
	public File uploadRS(File appl) {
		return entityManager.merge(appl);
	}

	@Override
	@Transactional

	public File uploadTS(File appl) {
		return entityManager.merge(appl);
	}

	@Override
	public List<Application> getApplications(Long id) {
		return entityManager.createQuery(
				"from Application where job.id = '" + id + "' order by id asc",
				Application.class).getResultList();

	}

}
