# Env

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
- Выполните `fetch_data.sh`
- Скачайте [файл](https://drive.google.com/file/d/1UX7QzC3vP-jQJhyxlxDNeCr87PngHEWY/view?usp=sharing), поместите сюда `data/FLAME2020/FLAME_texture.npz`

# Задание

См. `task.ipynb`

8GB видюхи должно хватить



