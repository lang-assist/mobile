const fs = require("fs");
const path = require("path");
const { execSync } = require("child_process");

// GraphQL şemasını Rover CLI ile çek
async function fetchSchema() {
  const schemaPath = path.join(
    __dirname,
    "..",
    "packages",
    "gql_data",
    "lib",
    "src",
    "schema.graphqls"
  );

  // Dizin yoksa oluştur
  const dir = path.dirname(schemaPath);
  if (!fs.existsSync(dir)) {
    fs.mkdirSync(dir, { recursive: true });
  }

  console.log("Downloading schema using Rover CLI...");
  try {
    execSync(
      `rover graph introspect http://localhost:3000/graphql --output "${schemaPath}"`,
      {
        stdio: "inherit",
      }
    );
    console.log(`Schema written to ${schemaPath}`);
  } catch (error) {
    console.error("Failed to download schema:", error);
    throw error;
  }
}

// build_runner'ı çalıştır
function runBuildRunner() {
  const packagePath = path.join(__dirname, "..", "packages", "gql_data");

  console.log(`Running build_runner in ${packagePath}`);

  try {
    execSync("dart run build_runner build --delete-conflicting-outputs", {
      cwd: packagePath,
      stdio: "inherit",
    });
    console.log("Build runner completed successfully");
  } catch (error) {
    console.error("Build runner failed:", error);
    process.exit(1);
  }
}

// Export'ları güncelle
function updateExports() {
  console.log(`Updating exports for data layer...`);
  try {
    execSync(`dart tools/add_exports.dart user`, {
      stdio: "inherit",
    });
  } catch (error) {
    console.error("Failed to update exports:", error);
    throw error;
  }
}

fetchSchema().then(() => {
  runBuildRunner();
  updateExports();
});
