import argparse
import dotenv
import os
import google.generativeai as palm

parser = argparse.ArgumentParser(description="Get file name")
parser.add_argument('filename')

dotenv.load_dotenv()
API_KEY = os.getenv('API_KEY')

palm.configure(api_key=API_KEY)

models = [m for m in palm.list_models() if 'generateText' in m.supported_generation_methods]
model = models[0].name
print(model)


def get_fix(path):
    prompt = '''
    You are an expert at analyzing logs.
    You have to summarize the content log content given to you and
    suggest ways to fix errors if possible. Ignore any warnings
    that you see.
    '''

    try:
        with open(path, 'r') as file:
            prompt += "\nAnalyze the following content:\n" + file.read()
            file.close()
    except FileNotFoundError:
        print("Unable to find specified file. Use pwd for referrence.")

    ans = palm.generate_text(model=model, prompt=prompt,
                             temperature=0, max_output_tokens=800)
    print(ans)


# if __name__ == '__main__':
args = parser.parse_args()
get_fix(args.filename)
