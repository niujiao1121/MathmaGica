"# MathmaGica" 

## 游戏玩法

回合制战斗冒险游戏，战斗系统为回合制，大地图上为箱庭式（类似《TUNIC》、《塞尔达传说三角力量2》）的类银河恶魔城游戏，收集武器、装备、魔法书、手札等。

战斗系统中，角色有属性 生命值$\text{HP}\in C$，魔力值$\text{SP}\in C$,战斗力$\text{ATK}\in C$，防御力$\text{DEF}\in C$​

有装备 **法杖**，**防具**。装备有**品质**：$\eta\in(0,1)$与**装备特性**：$f_w(\cdot),f_d(\cdot)$ 

可使用技能有**法术**，**法阵**，消耗SP。法术(spell)瞬发，有法术特性$f_s(\cdot)$。法阵(array)布置需一回合，有法阵特性$f_a(t,\cdot)$。

## 世界观

在一个盛行魔法的大陆上，有着几种存在形式，生物、不死族、神灵，不同的存在形式有不同的种族，种族之间各有不同，但都擅长魔法。生物学会了魔法结晶的形式，制造出**魔力水晶**，并研究出了魔力水晶的叠加，制造出了不同的魔力水晶。使用魔力水晶制造，得到了如今的法杖与防具；魔力水晶的种类决定了装备的装备特性。除了人造的魔力水晶，也有许多天然的能力未知的魔力水晶。

### 种族

定义属性矩阵$A=\begin{bmatrix}HP&SP\\ATK&DEF\end{bmatrix}$​

定义纯虚数集$P$

* 生物
  * 初始值$A_0=\begin{bmatrix}R^+&R^+\\R^+&R^+\end{bmatrix}$
  * 死亡判定 $Re(HP)<1$
* 不死族
  * 初始值$A_0=\begin{bmatrix}P&P\\P&P\end{bmatrix}$
  * 死亡判定 $|Im(HP)|<1$​
* 神灵
  * 初始值$A_0=\begin{bmatrix}C&C\\C&C\end{bmatrix}$​
  * 死亡判定 $|HP|<1$​


## 剧情

## 魔法设定

### 魔力水晶

* 白色魔力水晶 加法
* 黄色魔力水晶 乘法
* 橙色魔力水晶 指数
* 黑色魔力水晶 虚数
* 绿色魔力水晶 负数
* 粉色魔力水晶 根号

白色、黄色、橙色魔力水晶为可人造的水晶

#### 装备计算

* 白色$f_w(a)=a+100\eta, f_d(a)=a-100\eta$
* 黄色$f_e(a)=4\eta a,f_d(a)=\frac{1}{4\eta} a$
* 橙色$f_e(a)=a^{1+\eta},f_d(a)=a^{1-\eta}$
* 黑色$f_e(a)=f_d(a)=\eta ai$
* 绿色$f_e(a)=f_d(a)=-\eta a$
* 粉色$f_e(a)=f_d(a)=10\eta \sqrt{a}$

#### 伤害计算

$$
atk\longrightarrow f_s(atk)\longrightarrow damage = f_e(f_s(atk))\longrightarrow f_d(f_s'(damage))\longrightarrow f_d(f_s'(damage))-def
$$

$f'_s(\cdot)$为防御法术

### 手札



## 角色设定
