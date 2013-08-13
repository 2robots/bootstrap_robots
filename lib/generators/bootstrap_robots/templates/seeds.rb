userRole = Role.create({ title: "User" })
adminRole = Role.create({ title: "Admin" })
superAdminRole = Role.create({ title: "Superadmin" })

user1 = User.create({
  email: "franz@2robots.at",
  password: "password",
  password_confirmation: "password",
  role_id: superAdminRole.id
})