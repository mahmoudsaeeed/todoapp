# What I learned

## I learn how to use ChipsChoice<T>.single
410552214
### The parent File
  ```
  SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: CategoryChipWidget(
                  categoryIndex: _selectedChipIndex,
                  options: state.categories,
                  onChanged: (chipChoisedIndex) {
                    setState(() {
                      _selectedChipIndex = chipChoisedIndex;
                    });
                  },
                ),
              )
  ```

 ### The child file
  ```
    ChipsChoice<int>.single(
        value: categoryIndex,
        onChanged: onChanged,
        choiceItems: C2Choice.listFrom<int, categroyModel>(
          source: options,
          value: (index, categoryModel) => index,
          label: (index, categoryModel) => categoryModel.name,
        ),
      ),
  ```
#### Style of each ChipChoice
  ```
    style: (index, categoryModel) {
          Color myColor = Color(categoryModel.color);

          return C2ChipStyle.when(
            enabled: C2ChipStyle.toned(
                backgroundColor: myColor,
                backgroundOpacity: .3,
                selectedStyle: C2ChipStyle.filled(
                  color: Color(categoryModel.color),
                )),
          );
        },

        
  ```

  ### 🧩 أنماط `C2ChipStyle` في مكتبة `chips_choice`

#### 1. `filled`
- **الوصف:** خلفية بلون صلب بالكامل (غير شفافة).
- **يدعم الشفافية؟** ❌ لا (إلا إذا عدّلت `backgroundOpacity` أو `backgroundColor` يدويًا).
- **قابل للتخصيص؟** ✅ نعم.
- **أفضل استخدام:** لما تحب تعرض الشريحة بلون قوي وواضح.

#### 2. `outlined`
- **الوصف:** بدون تعبئة؛ فقط حدود بلون.
- **يدعم الشفافية؟** ✅ نعم (الخلفية شفافة افتراضيًا).
- **قابل للتخصيص؟** ✅ نعم.
- **أفضل استخدام:** لواجهة مستخدم خفيفة وبسيطة بدون تعبئة لونية.

#### 3. `toned`
- **الوصف:** خلفية بلون خفيف وشفافية تلقائية.
- **يدعم الشفافية؟** ✅ نعم (يضيف شفافية تلقائيًا).
- **قابل للتخصيص؟** ❌ محدود (لا يمكن تغيير درجة الشفافية بنفسك بسهولة).
- **أفضل استخدام:** عند الحاجة إلى لون خفيف بدون تعقيد في التخصيص.

#### 4. `when`
- **الوصف:** يتيح تخصيص التصميم حسب الحالة (مُحدد، غير مُحدد، مُعطّل).
- **يدعم الشفافية؟** ✅ نعم (حسب ما تحدده في كل حالة).
- **قابل للتخصيص؟** ✅✅ أعلى درجة تحكم.
- **أفضل استخدام:** لو محتاج لكل حالة تصميم مختلف تمامًا (لون، خلفية، حد، خط...).


----------------------------------------------------

## custom_decorations.dart
## theme_cubit.dart




## Navigator
you can pop with two ways
  - Navigator.popUntil(context , ModalRoute.withName(name))
  - Navigator.popUntil(context , (route)=>route.isFirst)
