
//
//public class UserDetailsServiceImpl implements UserDetailsService {
//
//    @Autowired
//    private UserDAO userDAO;
//
//    @Override
//    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//        Users user = userDAO.getUsersByUsername(username);
//
//        if (user == null) {
//            throw new UsernameNotFoundException("Could not find user");
//        }
//
//        return new MyUserDetails(user);
//    }
//}
