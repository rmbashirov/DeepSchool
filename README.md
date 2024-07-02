## DeepSchool 3D-CV homework

Homework for 3D-CV course hosted by https://deepschool.ru/

Lesson: Parametric Human Models



### Env
## Вариант без докера

- Сбилдите environment, он почти такой же, как в предыдущей домашке Артура про рендеринг:

```
conda create -n pytorch3d python=3.9
conda activate pytorch3d
conda install -y pytorch=1.13.0 torchvision pytorch-cuda=11.6 -c pytorch -c nvidia
conda install -y -c fvcore -c iopath -c conda-forge fvcore iopath
conda install -y -c bottler nvidiacub
conda install -y jupyter
pip install scikit-image matplotlib imageio plotly opencv-python
conda install pytorch3d -c pytorch3d
```

- Нужно доставить: `pip install kornia chumpy mxnet-mkl==1.6.0 numpy==1.23.1 face_alignment moviepy`
- Выполните `fetch_data.sh`, надо будет зарегаться тут [https://flame.is.tue.mpg.de](https://flame.is.tue.mpg.de/)
- Скачайте DECA модельку [тут](https://drive.usercontent.google.com/download?id=1rp8kdyLPvErw2dTmqtjISRVvQLj6Yzje), поместите сюда ./data/deca_model.tar
- Скачайте [файл](https://drive.google.com/file/d/1UX7QzC3vP-jQJhyxlxDNeCr87PngHEWY/view?usp=sharing), поместите сюда `data/FLAME2020/FLAME_texture.npz`

## Вариант с докером (адаптируйте команды под винду)

- Docker setup:
  - [Install docker](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository), выполните 1 и 2 с сайта
  - [Install nvidia-docker](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html), выполните Installing with Apt и Rootless mode
- Скачайте образ, ссылка в материалах задания или лично
- `docker load < образ.tar`
- `make jupyter`



### Задание

См. [`task.ipynb`](./task.ipynb)

8GB видюхи должно хватить



