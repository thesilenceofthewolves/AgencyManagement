//WorkersController
[ApiController]
[Route("api/[controller]")]
public class WorkersController : ControllerBase
{
    private readonly ApplicationDbContext _context;

    public WorkersController(ApplicationDbContext context)
    {
        _context = context;
    }
}