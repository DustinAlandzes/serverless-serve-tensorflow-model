# Backend

## how to install
```
cd backend/chalice_project
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

## how to run locally
```bash
chalice local
```

## how to run tests
```bash
pytest
```

## how to deploy
```
./generate-terraform-files.sh
```

This will create chalice.tf.json in the terraform folder.
Run `plan` and `apply` in terraform.