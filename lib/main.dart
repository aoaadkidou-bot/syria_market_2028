// ==============================================================================
// 8. شريط أسعار الصرف والذهب اللحظي (LiveCurrencyExchangeTicker)
// ==============================================================================
class LiveCurrencyExchangeTicker extends StatelessWidget {
  final double usdRate;
  final double gold21kPrice;
  final VoidCallback? onRefresh;

  const LiveCurrencyExchangeTicker({
    Key? key,
    required this.usdRate,
    required this.gold21kPrice,
    this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        border: Border(
          bottom: BorderSide(
            color: const Color(0xFFD4AF37).withOpacity(0.35),
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Text('💵 \$1 USD = ',
                  style: TextStyle(color: Colors.white70, fontSize: 11)),
              Text(
                '${usdRate.toInt()} ل.س',
                style: const TextStyle(
                  color: Color(0xFF22C55E),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Container(height: 14, width: 1, color: Colors.white24),
          Row(
            children: [
              const Text('🪙 غرام 21 = ',
                  style: TextStyle(color: Colors.white70, fontSize: 11)),
              Text(
                '${gold21kPrice.toInt()} ل.س',
                style: const TextStyle(
                  color: Color(0xFFD4AF37),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          if (onRefresh != null)
            GestureDetector(
              onTap: onRefresh,
              child: const Icon(Icons.sync, color: Color(0xFF38BDF8), size: 16),
            ),
        ],
      ),
    );
  }
}

// ==============================================================================
// 9. بطاقة بوابتي الدفع المعتمدتين حصرياً (شام كاش & بينانس USDT)
// ==============================================================================
class ExclusivePaymentGatewayCard extends StatelessWidget {
  const ExclusivePaymentGatewayCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFD4AF37), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  SyrianIndependenceFlag(width: 24, height: 16),
                  SizedBox(width: 8),
                  Text(
                    'بوابات الدفع والشحن الحصرية 💳',
                    style: TextStyle(
                      color: Color(0xFFD4AF37),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFF16A34A).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'معتمد 100%',
                  style: TextStyle(
                      color: Color(0xFF22C55E),
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // شام كاش
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(10),
              border:
                  Border.all(color: const Color(0xFF38BDF8).withOpacity(0.4)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          SyrianIndependenceFlag(width: 18, height: 12),
                          SizedBox(width: 6),
                          Text(
                            'حساب شام كاش (Sham Cash)',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 11),
                          ),
                          SizedBox(width: 6),
                          Text(
                            'بالليرة السورية',
                            style: TextStyle(
                                color: Color(0xFFD4AF37), fontSize: 9.5),
                          ),
                        ],
                      ),
                      const SizedBox(height: 3),
                      Text(
                        kShamCashAccountKey,
                        style: const TextStyle(
                          color: Color(0xFF38BDF8),
                          fontWeight: FontWeight.bold,
                          fontSize: 10.5,
                          letterSpacing: 0.5,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.copy,
                      color: Color(0xFFD4AF37), size: 18),
                  tooltip: 'نسخ مفتاح شام كاش',
                  onPressed: () {
                    Clipboard.setData(
                        const ClipboardData(text: kShamCashAccountKey));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('✓ تم نسخ مفتاح حساب شام كاش بنجاح!'),
                        backgroundColor: Color(0xFF0284C7),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),

          // بينانس USDT
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(10),
              border:
                  Border.all(color: const Color(0xFFFACC15).withOpacity(0.4)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Text(
                            '🪙 بينانس (Binance Pay / USDT)',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 11),
                          ),
                          SizedBox(width: 6),
                          Text(
                            'TRC20 / USD',
                            style: TextStyle(
                                color: Color(0xFF22C55E), fontSize: 9.5),
                          ),
                        ],
                      ),
                      const SizedBox(height: 3),
                      Text(
                        kBinanceWalletAddress,
                        style: const TextStyle(
                          color: Color(0xFFFACC15),
                          fontWeight: FontWeight.bold,
                          fontSize: 10.5,
                          letterSpacing: 0.5,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.copy,
                      color: Color(0xFFFACC15), size: 18),
                  tooltip: 'نسخ عنوان محفظة بينانس',
                  onPressed: () {
                    Clipboard.setData(
                        const ClipboardData(text: kBinanceWalletAddress));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                            '✓ تم نسخ عنوان محفظة بينانس USDT (TRC20) بنجاح!'),
                        backgroundColor: Color(0xFF16A34A),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ==============================================================================
// 10. محرك البانورامات التفاعلية والعروض المرئية المجدولة (DynamicPanoramasCarousel)
// ==============================================================================
class DynamicPanoramasCarousel extends StatefulWidget {
  final List<BannerItem> banners;
  final Function(BannerItem)? onBannerTap;

  const DynamicPanoramasCarousel({
    Key? key,
    required this.banners,
    this.onBannerTap,
  }) : super(key: key);

  @override
  State<DynamicPanoramasCarousel> createState() =>
      _DynamicPanoramasCarouselState();
}

class _DynamicPanoramasCarouselState extends State<DynamicPanoramasCarousel> {
  late PageController _pageController;
  int _currentIndex = 0;
  Timer? _autoScrollTimer;
  bool _isUserInteracting = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _autoScrollTimer?.cancel();
    if (widget.banners.isEmpty) return;

    final currentBanner = widget.banners[_currentIndex % widget.banners.length];
    final intervalSeconds = currentBanner.displayDurationSeconds.clamp(2, 15);

    _autoScrollTimer = Timer(Duration(seconds: intervalSeconds), () {
      if (!_isUserInteracting && mounted && widget.banners.isNotEmpty) {
        final nextIndex = (_currentIndex + 1) % widget.banners.length;
        _pageController.animateToPage(
          nextIndex,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOutCubic,
        );
        setState(() {
          _currentIndex = nextIndex;
        });
        _startAutoScroll();
      }
    });
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.banners.isEmpty) return const SizedBox.shrink();

    return Column(
      children: [
        SizedBox(
          height: 120,
          child: GestureDetector(
            onPanDown: (_) => setState(() => _isUserInteracting = true),
            onPanCancel: () {
              setState(() => _isUserInteracting = false);
              _startAutoScroll();
            },
            onPanEnd: (_) {
              setState(() => _isUserInteracting = false);
              _startAutoScroll();
            },
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.banners.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
                _startAutoScroll();
              },
              itemBuilder: (context, index) {
                final item = widget.banners[index];
                return GestureDetector(
                  onTap: () => widget.onBannerTap?.call(item),
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.35),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          AppSmartImage(
                            imageUrl: item.imageUrl,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.85),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 7, vertical: 3),
                              decoration: BoxDecoration(
                                color: item.badgeColor,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                item.badgeText,
                                style: const TextStyle(
                                  color: Color(0xFF0F172A),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 9.5,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 10,
                            right: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                if (item.subtitle.isNotEmpty) ...[
                                  const SizedBox(height: 2),
                                  Text(
                                    item.subtitle,
                                    style: const TextStyle(
                                      color: Color(0xFFD4AF37),
                                      fontSize: 10.5,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.banners.length, (index) {
            final isSelected = _currentIndex == index;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 2.5),
              height: 4,
              width: isSelected ? 16 : 4,
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFFD4AF37) : Colors.white24,
                borderRadius: BorderRadius.circular(3),
              ),
            );
          }),
        ),
      ],
    );
  }
}

// ==============================================================================
// 11. الشجرة الهيكلية للأقسام والفروع (DepartmentTreeItemWidget)
// ==============================================================================
class DepartmentTreeItemWidget extends StatefulWidget {
  final DepartmentNode node;
  final int depth;
  final Function(DepartmentNode)? onSelect;
  final Function(DepartmentNode)? onEdit;
  final Function(DepartmentNode)? onDelete;

  const DepartmentTreeItemWidget({
    Key? key,
    required this.node,
    this.depth = 0,
    this.onSelect,
    this.onEdit,
    this.onDelete,
  }) : super(key: key);

  @override
  State<DepartmentTreeItemWidget> createState() =>
      _DepartmentTreeItemWidgetState();
}

class _DepartmentTreeItemWidgetState extends State<DepartmentTreeItemWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final hasChildren = widget.node.subBranches.isNotEmpty;
    final isRoot = widget.depth == 0;

    return Padding(
      padding: EdgeInsets.only(
        left: (widget.depth * 12.0).clamp(0.0, 40.0),
        bottom: 5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: isRoot ? const Color(0xFF1E293B) : const Color(0xFF0F172A),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isRoot
                    ? const Color(0xFF38BDF8).withOpacity(0.5)
                    : Colors.white12,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  _getIcon(widget.node.iconName),
                  color: isRoot
                      ? const Color(0xFF38BDF8)
                      : const Color(0xFFD4AF37),
                  size: 18,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.node.nameAr,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight:
                              isRoot ? FontWeight.bold : FontWeight.w600,
                          fontSize: isRoot ? 12.5 : 11.5,
                        ),
                      ),
                      if (widget.node.description.isNotEmpty)
                        Text(
                          widget.node.description,
                          style: const TextStyle(
                              color: Colors.white54, fontSize: 9.5),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 1.5),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0284C7).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '${widget.node.activeAdsCount} إعلان',
                    style: const TextStyle(
                        color: Color(0xFF38BDF8),
                        fontSize: 9.5,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                if (widget.onEdit != null)
                  IconButton(
                    icon: const Icon(Icons.edit,
                        color: Color(0xFF38BDF8), size: 16),
                    onPressed: () => widget.onEdit?.call(widget.node),
                  ),
                if (hasChildren)
                  IconButton(
                    icon: Icon(
                      _isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.white70,
                      size: 18,
                    ),
                    onPressed: () => setState(() => _isExpanded = !_isExpanded),
                  ),
              ],
            ),
          ),
          if (_isExpanded && hasChildren)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Column(
                children: widget.node.subBranches.map((child) {
                  return DepartmentTreeItemWidget(
                    node: child,
                    depth: widget.depth + 1,
                    onSelect: widget.onSelect,
                    onEdit: widget.onEdit,
                    onDelete: widget.onDelete,
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }

  IconData _getIcon(String name) {
    switch (name) {
      case 'DirectionsCar':
        return Icons.directions_car;
      case 'Home':
        return Icons.home;
      case 'WbSunny':
        return Icons.wb_sunny;
      case 'Smartphone':
        return Icons.phone_android;
      default:
        return Icons.category;
    }
  }
}

// ==============================================================================
// 12. نافذة البحث الصوتي الذكي بالميكروفون (VoiceInputDialog)
// ==============================================================================
class VoiceInputDialog extends StatefulWidget {
  final String title;

  const VoiceInputDialog({Key? key, required this.title}) : super(key: key);

  @override
  State<VoiceInputDialog> createState() => _VoiceInputDialogState();
}

class _VoiceInputDialogState extends State<VoiceInputDialog> {
  final TextEditingController _inputController = TextEditingController();

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Row(
        children: [
          const Icon(Icons.mic, color: Color(0xFF0284C7)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              widget.title,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'تحدث الآن بوضوح أو اكتب الكلمات المراد البحث عنها في السوق:',
            style: TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _inputController,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: 'مثال: سيارة كيا، شقة للإيجار بدمشق...',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('إلغاء'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0F172A)),
          onPressed: () {
            final val = _inputController.text.trim();
            Navigator.pop(context, val);
          },
          child: const Text('بحث 🔍', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}

// ==============================================================================
// 13. القائمة الجانبية السيادية المتقدمة (CustomServerDrawer)
// ==============================================================================
class CustomServerDrawer extends StatelessWidget {
  final String userId;
  final VoidCallback onOpenContactAdmin;
  final VoidCallback onOpenFeedback;
  final VoidCallback onOpenPlans;
  final VoidCallback onOpenAdminPanel;

  const CustomServerDrawer({
    Key? key,
    required this.userId,
    required this.onOpenContactAdmin,
    required this.onOpenFeedback,
    required this.onOpenPlans,
    required this.onOpenAdminPanel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final manager = AppStateManager();
    final plan = manager.getCurrentUserPlan();

    // التحقق الصارم من الحسابين المخولين حصراً بغرفة العمليات
    final authUser = Supabase.instance.client.auth.currentUser;
    final currentEmail =
        (authUser?.email ?? manager.currentUserEmail).toLowerCase().trim();
    const authorizedAdmins = [
      'aoaadabdo@gmail.com',
      'sameraoaad@gmail.com',
    ];
    final bool isSuperAdmin = authorizedAdmins.contains(currentEmail);

    return Drawer(
      backgroundColor: manager.scaffoldBgColor,
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 50, bottom: 20, right: 16, left: 16),
            color: manager.appBarColor,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: manager.secondaryColor,
                  child: Text(
                    manager.currentUserName.isNotEmpty
                        ? manager.currentUserName[0]
                        : 'س',
                    style: TextStyle(
                      color: manager.primaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              manager.currentUserName.isNotEmpty
                                  ? manager.currentUserName
                                  : 'سوق سوريا الشامل',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 6),
                          // 🟢⚪🖤 علم الاستقلال السوري المعتمد والوحيد
                          Container(
                            width: 26,
                            height: 16,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              border:
                                  Border.all(color: Colors.white24, width: 0.5),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                    child: Container(
                                        color:
                                            const Color(0xFF007A3D))), // أخضر
                                Expanded(
                                  child: Container(
                                    color: Colors.white,
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(Icons.star,
                                            size: 3.5, color: Colors.red),
                                        Icon(Icons.star,
                                            size: 3.5, color: Colors.red),
                                        Icon(Icons.star,
                                            size: 3.5, color: Colors.red),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child:
                                        Container(color: Colors.black)), // أسود
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'باقة: ${plan.name}',
                        style: TextStyle(
                          color: manager.secondaryColor,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        manager.isLoggedIn
                            ? manager.currentUserEmail
                            : 'زائر المنصة الكريم',
                        style: const TextStyle(
                            color: Colors.white60, fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              children: [
                ListTile(
                  leading:
                      Icon(Icons.headset_mic, color: manager.secondaryColor),
                  title: const Text('تواصل مباشر مع الإدارة'),
                  subtitle: const Text('واتساب أو اتصال هاتفي فوري'),
                  onTap: () {
                    Navigator.pop(context);
                    onOpenContactAdmin();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.lightbulb, color: manager.secondaryColor),
                  title: const Text('صوتك مسموع 💡 (اقتراح ميزة)'),
                  subtitle: const Text('إرسال فكرة مع لقطة شاشة'),
                  onTap: () {
                    Navigator.pop(context);
                    onOpenFeedback();
                  },
                ),
                // 💎 باقات الاشتراك والترقية VIP - تفتح الشاشة الحقيقية والأسعار مباشرة
                ListTile(
                  leading: const Icon(Icons.workspace_premium,
                      color: Color(0xFFD4AF37)),
                  title: const Text('باقات الاشتراك والترقية VIP 👑',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  subtitle: const Text(
                      'ترقية حسابك، شام كاش، بينانس USDT ورفع الإيصال',
                      style: TextStyle(fontSize: 11, color: Colors.white60)),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded,
                      size: 14, color: Color(0xFFD4AF37)),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => const SubscriptionPlansScreen(),
                      ),
                    );
                  },
                ),
                // دليل المكاتب العقارية لجميع المستخدمين
                ListTile(
                  leading: const Icon(Icons.real_estate_agent,
                      color: Color(0xFFD4AF37)),
                  title: const Text(
                    'دليل المكاتب العقارية المعتمدة 🏢',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: const Text(
                    'تصفح مكاتب وشركات العقارات في سوريا',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => const RealEstateDirectoryScreen()),
                    );
                  },
                ),
                const Divider(),
                // زر إضافة وتوثيق مكتب عقاري - محمي حصرياً للمشرفين والمسؤولين
                if (isSuperAdmin) ...[
                  ListTile(
                    leading: const Icon(Icons.add_business,
                        color: Color(0xFFD4AF37)),
                    title: const Text(
                      'إضافة مكتب عقاري رسمي 🛡️',
                      style: TextStyle(
                          color: Color(0xFFD4AF37),
                          fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: const Text(
                      'صلاحية إدارية خاصة بالمشرفين والمسؤولين',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) =>
                                const RealEstateDirectoryScreen()),
                      );
                    },
                  ),
                  const Divider(),
                ],
                // 🛡️ غرفة العمليات المركزية - تظهر فقط وفقط للحسابين الإداريين المعتمدين
                if (isSuperAdmin) ...[
                  ListTile(
                    leading: const Icon(Icons.admin_panel_settings,
                        color: Colors.redAccent),
                    title: const Text(
                      'غرفة العمليات المركزية 🛡️',
                      style: TextStyle(
                          color: Colors.redAccent, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: const Text(
                      'لوحة تحكم الإدارة الكاملة بـ 9 قطاعات',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      onOpenAdminPanel();
                    },
                  ),
                  const Divider(),
                ],
                ListTile(
                  leading: const Icon(Icons.share, color: Colors.blue),
                  title: const Text(
                    'مشاركة رابط المنصة',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Share.share(
                      'حمل واستمتع بأقوى سوق إلكتروني حر في سوريا 2028:\n$kDefaultShareDomain',
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SyrianIndependenceFlag(width: 18, height: 12),
                  const SizedBox(width: 6),
                  Text(
                    'سوق سوريا الشامل © 2028 • النسخة السيادية 5.0',
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 10),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ==============================================================================
// 14. شاشة تفاصيل البنر والبانوراما الإعلانية (FullBannerDetailsScreen)
// مزودة بجميع أزرار وروابط التواصل الاجتماعي والمواقع بالكامل
// ==============================================================================
class FullBannerDetailsScreen extends StatelessWidget {
  final BannerItem banner;

  const FullBannerDetailsScreen({Key? key, required this.banner})
      : super(key: key);

  Future<void> _launchExternalUrl(String urlStr) async {
    if (urlStr.trim().isEmpty) return;
    String target = urlStr.trim();
    if (!target.startsWith('http://') && !target.startsWith('https://')) {
      target = 'https://$target';
    }
    try {
      final uri = Uri.parse(target);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      debugPrint('Launch URL err: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final manager = AppStateManager();

    return Scaffold(
      backgroundColor: manager.scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: manager.appBarColor,
        title: Text(
          banner.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 230,
            child: PageView.builder(
              itemCount:
                  banner.imageUrls.isNotEmpty ? banner.imageUrls.length : 1,
              itemBuilder: (ctx, idx) {
                final url = banner.imageUrls.isNotEmpty
                    ? banner.imageUrls[idx]
                    : banner.imageUrl;
                return AppSmartImage(imageUrl: url, fit: BoxFit.cover);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: banner.badgeColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        banner.badgeText,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_on,
                            size: 15, color: Colors.red),
                        const SizedBox(width: 4),
                        Text(
                          banner.location,
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  banner.title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                if (banner.subtitle.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    banner.subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: manager.secondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
                const Divider(height: 24),
                const Text(
                  'تفاصيل ومواصفات العرض الترويجي:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 8),
                Text(
                  banner.description.isNotEmpty
                      ? banner.description
                      : 'تواصل مع المعلن مباشرة للاستفادة من كامل العروض والخدمات.',
                  style: const TextStyle(fontSize: 13, height: 1.6),
                ),
                const SizedBox(height: 20),

                // أزرار التواصل المباشر (اتصال وواتساب)
                Row(
                  children: [
                    if (banner.phone.isNotEmpty)
                      Expanded(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: manager.primaryColor,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          icon: const Icon(Icons.phone,
                              color: Colors.white, size: 18),
                          label: const Text(
                            'اتصال بالمعلن',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () async {
                            final uri = Uri.parse('tel:${banner.phone}');
                            if (await canLaunchUrl(uri)) await launchUrl(uri);
                          },
                        ),
                      ),
                    if (banner.phone.isNotEmpty && banner.whatsapp.isNotEmpty)
                      const SizedBox(width: 10),
                    if (banner.whatsapp.isNotEmpty)
                      Expanded(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF25D366),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          icon: const Icon(Icons.chat,
                              color: Colors.white, size: 18),
                          label: const Text(
                            'واتساب المعلن',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () async {
                            final clean =
                                PhoneHelper.formatForWhatsapp(banner.whatsapp);
                            final msg = Uri.encodeComponent(
                                'مرحباً، بخصوص إعلانكم في بانوراما سوق سوريا الشامل (${banner.title}):');
                            final uri =
                                Uri.parse('https://wa.me/$clean?text=$msg');
                            if (await canLaunchUrl(uri)) {
                              await launchUrl(uri,
                                  mode: LaunchMode.externalApplication);
                            }
                          },
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 16),

                // أزرار وحسابات التواصل الاجتماعي والمواقع (فيسبوك، إنستغرام، تيك توك، تيليجرام، يوتيوب، الموقع)
                const Text(
                  'قنوات وصفحات التواصل والموقع 🌐:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    if (banner.facebookUrl.isNotEmpty)
                      ActionChip(
                        avatar: const Icon(Icons.facebook,
                            color: Color(0xFF1877F2), size: 18),
                        label: const Text('فيسبوك'),
                        onPressed: () => _launchExternalUrl(banner.facebookUrl),
                      ),
                    if (banner.instagramUrl.isNotEmpty)
                      ActionChip(
                        avatar: const Icon(Icons.camera_alt,
                            color: Color(0xFFE4405F), size: 18),
                        label: const Text('إنستغرام'),
                        onPressed: () =>
                            _launchExternalUrl(banner.instagramUrl),
                      ),
                    if (banner.telegramUrl.isNotEmpty)
                      ActionChip(
                        avatar: const Icon(Icons.send,
                            color: Color(0xFF0088CC), size: 18),
                        label: const Text('تيليجرام'),
                        onPressed: () => _launchExternalUrl(banner.telegramUrl),
                      ),
                    if (banner.tiktokUrl.isNotEmpty)
                      ActionChip(
                        avatar: const Icon(Icons.music_note,
                            color: Colors.black, size: 18),
                        label: const Text('تيك توك'),
                        onPressed: () => _launchExternalUrl(banner.tiktokUrl),
                      ),
                    if (banner.youtubeUrl.isNotEmpty)
                      ActionChip(
                        avatar: const Icon(Icons.play_circle_fill,
                            color: Color(0xFFFF0000), size: 18),
                        label: const Text('يوتيوب'),
                        onPressed: () => _launchExternalUrl(banner.youtubeUrl),
                      ),
                    if (banner.linkUrl.isNotEmpty)
                      ActionChip(
                        avatar: const Icon(Icons.language,
                            color: Color(0xFF0284C7), size: 18),
                        label: const Text('الموقع الإلكتروني'),
                        onPressed: () => _launchExternalUrl(banner.linkUrl),
                      ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ==============================================================================
// 15. شاشة "صوتك مسموع 💡" وصندوق مقترحات وتطوير المنصة (AppFeedbackScreen)
// ==============================================================================
class AppFeedbackScreen extends StatefulWidget {
  const AppFeedbackScreen({Key? key}) : super(key: key);

  @override
  State<AppFeedbackScreen> createState() => _AppFeedbackScreenState();
}

class _AppFeedbackScreenState extends State<AppFeedbackScreen> {
  final AppStateManager _manager = AppStateManager();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  String _feedbackType = 'فكرة وميزة جديدة 💡';
  final List<String> _feedbackTypes = [
    'فكرة وميزة جديدة 💡',
    'اقتراح لتطوير التطبيق 🚀',
    'بلاغ عن مشكلة تقنية ⚠️',
    'طلب حجز بنر إعلاني 🌟',
    'شكر وتقدير للإدارة ❤️'
  ];

  final ImagePicker _picker = ImagePicker();
  Uint8List? _screenshotBytes;
  bool _isSending = false;

  @override
  void initState() {
    super.initState();
    _nameController.text = _manager.currentUserName;
    _contactController.text = _manager.currentUserPhone.isNotEmpty
        ? _manager.currentUserPhone
        : _manager.currentUserEmail;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _contactController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  Future<void> _pickScreenshot() async {
    try {
      final XFile? file = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 60,
        maxWidth: 800,
      );
      if (file != null) {
        final bytes = await file.readAsBytes();
        setState(() => _screenshotBytes = bytes);
      }
    } catch (e) {
      debugPrint('Pick screenshot notice: $e');
    }
  }

  Future<void> _submitFeedback() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isSending = true);

    String? uploadedScreenshotUrl;
    if (_screenshotBytes != null) {
      uploadedScreenshotUrl = await StorageUploadService.uploadImageBytes(
        bucketName: kStorageBucketFeedbacks,
        imageBytes: _screenshotBytes!,
        prefix: 'feedback',
      );
    }

    final newFeedback = AppFeedbackItem(
      id: 'fb_${DateTime.now().millisecondsSinceEpoch}',
      userId: _manager.currentUserId,
      userName: _nameController.text.trim().isNotEmpty
          ? _nameController.text.trim()
          : 'زائر المنصة',
      userContact: _contactController.text.trim(),
      type: _feedbackType,
      content: _contentController.text.trim(),
      screenshotUrl: uploadedScreenshotUrl,
      createdAt: DateTime.now(),
    );

    setState(() {
      _manager.feedbacks.insert(0, newFeedback);
    });

    try {
      await Supabase.instance.client
          .from('app_feedback')
          .insert(newFeedback.toMap())
          .timeout(const Duration(seconds: 8));
    } catch (_) {}

    try {
      final alertText = '💡 مقترح أو بلاغ جديد عبر صوتك مسموع:\n'
          '👤 الاسم: ${newFeedback.userName}\n'
          '📞 للتواصل: ${newFeedback.userContact}\n'
          '🏷️ النوع: ${newFeedback.type}\n'
          '📝 التفاصيل: ${newFeedback.content}\n'
          '${uploadedScreenshotUrl != null ? "📸 لقطة الشاشة: $uploadedScreenshotUrl" : ""}';
      await _manager.sendTelegramAlert(alertText);
    } catch (_) {}

    if (mounted) {
      setState(() => _isSending = false);
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 24),
              SizedBox(width: 8),
              Text('شكراً لمشاركتك القيّمة ❤️', style: TextStyle(fontSize: 16)),
            ],
          ),
          content: const Text(
            'تم إرسال رسالتك ومقترحك مباشرةً إلى غرفة عمليات الإدارة. نحن نقرأ كافة الأفكار بعناية فائقة لتطوير سوق سوريا الشامل.',
            style: TextStyle(fontSize: 13, height: 1.5),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: _manager.primaryColor),
              onPressed: () {
                Navigator.pop(ctx);
                Navigator.pop(context);
              },
              child: const Text('حسناً', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _manager.scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: _manager.appBarColor,
        title: const Text(
          'صوتك مسموع 💡 (اقترح وطوّر)',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: _manager.secondaryColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
                border:
                    Border.all(color: _manager.secondaryColor.withOpacity(0.5)),
              ),
              child: Row(
                children: [
                  Icon(Icons.lightbulb,
                      color: _manager.secondaryColor, size: 28),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'رأيك يصنع الفرق! شاركنا بأي فكرة، ميزة جديدة، أو ملاحظة لتطوير التطبيق لخدمتك بشكل أفضل.',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _feedbackType,
              isExpanded: true,
              decoration: InputDecoration(
                labelText: 'نوع الرسالة أو المقترح',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              items: _feedbackTypes
                  .map((t) => DropdownMenuItem(
                        value: t,
                        child: Text(t,
                            style: const TextStyle(fontSize: 13),
                            overflow: TextOverflow.ellipsis),
                      ))
                  .toList(),
              onChanged: (v) => setState(() => _feedbackType = v!),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'اسمك الكريم (اختياري)',
                prefixIcon: const Icon(Icons.person),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _contactController,
              decoration: InputDecoration(
                labelText: 'رقم هاتفك أو بريدك للتواصل والمتابعة',
                prefixIcon: const Icon(Icons.contact_phone),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              validator: (v) => (v == null || v.trim().isEmpty)
                  ? 'يرجى إدخال وسيلة تواصل'
                  : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _contentController,
              maxLines: 5,
              maxLength: 500,
              decoration: InputDecoration(
                labelText: 'تفاصيل الفكرة أو الملاحظة *',
                hintText: 'اكتب اقتراحك بالتفصيل هنا...',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              validator: (v) => (v == null || v.trim().length < 5)
                  ? 'يرجى كتابة تفاصيل المقترح'
                  : null,
            ),
            const SizedBox(height: 8),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: Icon(
                  _screenshotBytes != null
                      ? Icons.check_circle
                      : Icons.add_photo_alternate,
                  color: _screenshotBytes != null ? Colors.green : Colors.grey,
                ),
                title: Text(
                  _screenshotBytes != null
                      ? 'تم إرفاق لقطة الشاشة'
                      : 'إرفاق لقطة شاشة توضيحية (اختياري)',
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold),
                ),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: _manager.primaryColor),
                  onPressed: _pickScreenshot,
                  child: Text(_screenshotBytes != null ? 'تغيير' : 'اختيار',
                      style:
                          const TextStyle(color: Colors.white, fontSize: 11)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _manager.buttonColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: _isSending ? null : _submitFeedback,
                child: _isSending
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        'إرسال لصاحب التطبيق مباشرةً 🚀',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==============================================================================
// 16. واجهة المصادقة واسترجاع كلمة المرور الحقيقية (AuthScreen)
// ==============================================================================
class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final AppStateManager _manager = AppStateManager();
  final _formKey = GlobalKey<FormState>();

  bool _isLoginMode = true;
  bool _isSubmitting = false;
  bool _obscurePassword = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _showForgotPasswordDialog() {
    final resetEmailController =
        TextEditingController(text: _emailController.text);

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            Icon(Icons.lock_reset, color: _manager.primaryColor),
            const SizedBox(width: 8),
            const Text('استرجاع كلمة المرور', style: TextStyle(fontSize: 16)),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'أدخل بريدك الإلكتروني المسجل، وسنرسل لك رابط إعادة تعيين كلمة المرور فوراً عبر خادم السحابة:',
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: resetEmailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'البريد الإلكتروني',
                hintText: 'example@gmail.com',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx), child: const Text('إلغاء')),
          ElevatedButton(
            style:
                ElevatedButton.styleFrom(backgroundColor: _manager.buttonColor),
            onPressed: () async {
              final email = resetEmailController.text.trim();
              if (email.isEmpty || !email.contains('@')) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('يرجى إدخال بريد إلكتروني صالح')),
                );
                return;
              }
              Navigator.pop(ctx);

              try {
                await Supabase.instance.client.auth
                    .resetPasswordForEmail(email)
                    .timeout(const Duration(seconds: 12));
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          '✅ تم إرسال رابط استرجاع كلمة المرور لبريدك الإلكتروني.'),
                    ),
                  );
                }
              } on SocketException catch (_) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          '⚠️ تعذر الاتصال بالخادم، يرجى التأكد من اتصال الإنترنت.'),
                      backgroundColor: Colors.orange,
                    ),
                  );
                }
              } catch (e) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('تنبيه استرجاع كلمة المرور: $e')),
                  );
                }
              }
            },
            child: const Text('إرسال الرابط',
                style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Future<void> _submitAuth() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isSubmitting = true);

    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final name = _nameController.text.trim();
    final phone = _phoneController.text.trim();

    try {
      if (_isLoginMode) {
        final AuthResponse res = await Supabase.instance.client.auth
            .signInWithPassword(
              email: email,
              password: password,
            )
            .timeout(const Duration(seconds: 15));

        if (res.user != null) {
          final isSuper = kAuthorizedAdminEmails.contains(email.toLowerCase());

          // مزامنة فورية لجدول profiles في Supabase
          try {
            await Supabase.instance.client.from('profiles').upsert({
              'id': res.user!.id,
              'email': email,
              'display_name': name.isNotEmpty ? name : email.split('@').first,
              'role': isSuper ? 'admin' : 'user',
              'is_active': true,
            });
          } catch (_) {}

          await _manager.setSessionUser(
            userId: res.user!.id,
            email: email,
            name: res.user!.userMetadata?['name']?.toString() ?? name,
            phone: res.user!.phone ??
                res.user!.userMetadata?['phone']?.toString() ??
                phone,
            role: isSuper ? 'super_admin' : 'user',
          );
        }
      } else {
        final AuthResponse res = await Supabase.instance.client.auth.signUp(
          email: email,
          password: password,
          data: {'name': name, 'phone': phone},
        ).timeout(const Duration(seconds: 15));

        if (res.user != null) {
          final isSuper = kAuthorizedAdminEmails.contains(email.toLowerCase());

          // إنشاء ملف حقيقي في جدول profiles في Supabase
          try {
            await Supabase.instance.client.from('profiles').upsert({
              'id': res.user!.id,
              'email': email,
              'display_name': name.isNotEmpty ? name : email.split('@').first,
              'role': isSuper ? 'admin' : 'user',
              'is_active': true,
            });
          } catch (_) {}

          await _manager.setSessionUser(
            userId: res.user!.id,
            email: email,
            name: name,
            phone: phone,
            role: isSuper ? 'super_admin' : 'user',
          );
        }
      }

      if (mounted) {
        setState(() => _isSubmitting = false);
        Navigator.pop(context);
      }
    } on AuthException catch (e) {
      if (mounted) {
        setState(() => _isSubmitting = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('خطأ في بيانات الحساب: ${e.message}'),
            backgroundColor: Colors.red.shade800,
          ),
        );
      }
    } on SocketException catch (_) {
      if (mounted) {
        setState(() => _isSubmitting = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
                'تعذر الاتصال بالخادم، يرجى التحقق من اتصال الإنترنت وإعادة المحاولة.'),
            backgroundColor: Colors.orange.shade900,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isSubmitting = false);
        final errStr = e.toString();
        final displayMsg = errStr.contains('SocketException') ||
                errStr.contains('connection abort') ||
                errStr.contains('TimeoutException')
            ? 'انقطع الاتصال مؤقتاً أثناء التوثيق. يرجى المحاولة مجدداً.'
            : 'تنبيه المصادقة: $errStr';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(displayMsg),
            backgroundColor: Colors.red.shade800,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _manager.scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: _manager.appBarColor,
        title: Text(
          _isLoginMode ? 'تسجيل الدخول' : 'إنشاء حساب جديد',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: _manager.primaryColor,
                    shape: BoxShape.circle,
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 8)
                    ],
                  ),
                  child: Icon(Icons.storefront,
                      size: 48, color: _manager.secondaryColor),
                ),
                const SizedBox(height: 14),
                Text(
                  _manager.appTitle,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: _manager.primaryColor,
                  ),
                ),
                Text(
                  _isLoginMode
                      ? 'أهلاً بك مجدداً في سوقك الحر'
                      : 'انضم لآلاف البائعين والمشترين في سوريا',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 24),
                if (!_isLoginMode) ...[
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'الاسم الكامل أو اسم المتجر *',
                      prefixIcon: const Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    validator: (v) =>
                        (v == null || v.trim().isEmpty) ? 'الاسم مطلوب' : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'رقم هاتف الاتصال والواتساب *',
                      hintText: '0933000000',
                      prefixIcon: const Icon(Icons.phone),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    validator: (v) =>
                        (v == null || !PhoneHelper.isValidPhone(v))
                            ? 'رقم هاتف صالح مطلوب'
                            : null,
                  ),
                  const SizedBox(height: 12),
                ],
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'البريد الإلكتروني *',
                    hintText: 'example@gmail.com',
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  validator: (v) => (v == null || !v.contains('@'))
                      ? 'بريد إلكتروني صالح مطلوب'
                      : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'كلمة المرور *',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () =>
                          setState(() => _obscurePassword = !_obscurePassword),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  validator: (v) => (v == null || v.length < 6)
                      ? 'كلمة المرور يجب أن لا تقل عن 6 خانات'
                      : null,
                ),
                if (_isLoginMode) ...[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: _showForgotPasswordDialog,
                      child: const Text('نسيت كلمة المرور؟',
                          style: TextStyle(fontSize: 12, color: Colors.blue)),
                    ),
                  ),
                ] else ...[
                  const SizedBox(height: 16),
                ],
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _manager.buttonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: _isSubmitting ? null : _submitAuth,
                    child: _isSubmitting
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text(
                            _isLoginMode
                                ? 'تسجيل الدخول 🚀'
                                : 'إنشاء الحساب فوراً ✨',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () => setState(() => _isLoginMode = !_isLoginMode),
                  child: Text(
                    _isLoginMode
                        ? 'ليس لديك حساب؟ سجل حساباً جديداً الآن'
                        : 'لديك حساب بالفعل؟ سجل دخولك',
                    style: TextStyle(
                        color: _manager.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// ==============================================================================
// 🌟 سوق سوريا الشامل 2028 - المنظومة السيادية الحقيقية المتكاملة 100%
// [القسم الثالث: شاشة المعاينة، تفاصيل الإعلان والمزاد الحي، والشاشة الرئيسية الكبرى مع الفلترة والمزامنة]
// ==============================================================================

// ==============================================================================
// 17. شاشة معاينة ومشاركة المنشور بنمط صفحة الويب المدمجة (InAppPostWebPreviewScreen)
// ==============================================================================
class InAppPostWebPreviewScreen extends StatelessWidget {
  final AdItem ad;

  const InAppPostWebPreviewScreen({Key? key, required this.ad})
      : super(key: key);

  String get shareableWebUrl =>
      'https://celadon-pithivier-77918a.netlify.app/ad/${ad.id}';

  void _copyShareableLink(BuildContext context) {
    Clipboard.setData(ClipboardData(text: shareableWebUrl));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('✅ تم نسخ رابط المنشور الرسمي للحافظة بنجاح!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _shareViaWhatsApp(BuildContext context) async {
    final title = Uri.encodeComponent(
      '🌟 شاهد إعلان "${ad.title}" على سوق سوريا الشامل 2028:\n'
      '📍 المحافظة: ${ad.governorate} - ${ad.neighborhood}\n'
      '💵 السعر: \$${ad.priceUsd ?? 0} (${ad.priceSyp ?? 0} ل.س)\n'
      '🔗 رابط المعاينة المباشر: $shareableWebUrl',
    );
    final uri = Uri.parse('https://wa.me/?text=$title');
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        title: const Text(
          'معاينة الرابط الرسمي للمنشور 🌐',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.copy, color: Color(0xFFD4AF37)),
            tooltip: 'نسخ الرابط',
            onPressed: () => _copyShareableLink(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.lock, color: Colors.green, size: 16),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      shareableWebUrl,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                        fontFamily: 'monospace',
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Card(
              color: const Color(0xFF1E293B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
                side: const BorderSide(color: Color(0xFFD4AF37), width: 1.2),
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 220,
                    width: double.infinity,
                    child: AppSmartImage(
                      imageUrl:
                          ad.imageUrls.isNotEmpty ? ad.imageUrls.first : '',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ad.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            if (ad.priceUsd != null)
                              Text(
                                '\$${ad.priceUsd!.toStringAsFixed(0)}',
                                style: const TextStyle(
                                  color: Color(0xFF22C55E),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            const SizedBox(width: 8),
                            if (ad.priceSyp != null)
                              Text(
                                '${ad.priceSyp!.toStringAsFixed(0)} ل.س',
                                style: const TextStyle(
                                  color: Color(0xFFD4AF37),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '📍 ${ad.governorate} - ${ad.neighborhood}',
                          style: const TextStyle(
                              color: Colors.white70, fontSize: 12),
                        ),
                        const Divider(color: Colors.white24, height: 24),
                        Text(
                          ad.description,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 14,
                              backgroundColor: const Color(0xFFD4AF37),
                              child: Text(
                                ad.publisherName.isNotEmpty
                                    ? ad.publisherName[0]
                                    : 'U',
                                style: const TextStyle(
                                    color: Color(0xFF0F172A),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'المعلن: ${ad.publisherName}',
                              style: const TextStyle(
                                  color: Colors.white70, fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF25D366),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    icon: const Icon(Icons.share, color: Colors.white),
                    label: const Text(
                      'مشاركة عبر واتساب',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () => _shareViaWhatsApp(context),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFD4AF37)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    icon: const Icon(Icons.copy, color: Color(0xFFD4AF37)),
                    label: const Text(
                      'نسخ الرابط',
                      style: TextStyle(
                          color: Color(0xFFD4AF37),
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () => _copyShareableLink(context),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ==============================================================================
// 18. شاشة تفاصيل الإعلانات والمزادات الحرة الكبرى (FullAdDetailsScreen)
// ==============================================================================
class FullAdDetailsScreen extends StatefulWidget {
  final AdItem ad;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;
  final Function(AdItem) onAdUpdated;
  final Function(String) onAdDeleted;

  const FullAdDetailsScreen({
    Key? key,
    required this.ad,
    required this.isFavorite,
    required this.onToggleFavorite,
    required this.onAdUpdated,
    required this.onAdDeleted,
  }) : super(key: key);
  @override
  State<FullAdDetailsScreen> createState() => _FullAdDetailsScreenState();
}

class _FullAdDetailsScreenState extends State<FullAdDetailsScreen> {
  final AppStateManager _manager = AppStateManager();
  late AdItem _currentAd;
  final PageController _pageController = PageController();
  final TransformationController _zoomController = TransformationController();
  int _currentImageIndex = 0;
  double _currentScale = 1.0;

  final TextEditingController _bidController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  bool _isPlacingBid = false;
  List<AdCommentItem> _adComments = [];
  StreamSubscription? _commentsSubscription;
  bool _isLoadingComments = false;
  Timer? _countdownTimer;

  @override
  void initState() {
    super.initState();
    _currentAd = widget.ad;
    _loadComments();

    if (_currentAd.isSold) {
      _startSoldCountdownTimer();
    }
  }

  @override
  void dispose() {
    _commentsSubscription?.cancel();
    _countdownTimer?.cancel();
    _pageController.dispose();
    _zoomController.dispose();
    _bidController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  // توحيد عداد ختم البيع التنازلي (5 دقائق) بدقة مركزية
  void _startSoldCountdownTimer() {
    _countdownTimer?.cancel();
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (!mounted) return;
      if (_currentAd.soldAt != null) {
        final elapsed = DateTime.now().difference(_currentAd.soldAt!);
        if (elapsed >= const Duration(minutes: 5) || _currentAd.isSoldExpired) {
          timer.cancel();
          final deletedId = _currentAd.id;

          try {
            await Supabase.instance.client
                .from('ad_comments')
                .delete()
                .eq('ad_id', deletedId);
            await Supabase.instance.client
                .from('favorites')
                .delete()
                .eq('ad_id', deletedId);
            await Supabase.instance.client
                .from('ads')
                .delete()
                .eq('id', deletedId);
          } catch (e) {
            debugPrint('Error auto-deleting from Supabase: $e');
          }

          _manager.deleteAdCompletely(deletedId);
          _manager.ads.removeWhere((a) => a.id == deletedId);
          _manager.notifyListeners();
          widget.onAdDeleted(deletedId);

          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                    '⏳ انتهت مهلة الـ 5 دقائق وتم حذف المنشور المباع نهائياً من السيرفر.'),
                backgroundColor: Colors.redAccent,
              ),
            );
            Navigator.pop(context);
          }
        } else {
          setState(() {});
        }
      }
    });
  }

  Future<void> _loadComments() async {
    setState(() => _isLoadingComments = true);

    // 1. جلب فوري ومباشر من السيرفر
    try {
      final res = await Supabase.instance.client
          .from('ad_comments')
          .select()
          .eq('ad_id', _currentAd.id.toString())
          .order('created_at', ascending: true);

      if (res is List && mounted) {
        setState(() {
          _adComments = res.map((m) => AdCommentItem.fromMap(m)).toList();
          _isLoadingComments = false;
        });
      }
    } catch (e) {
      debugPrint('Direct Comments Fetch Error: $e');
      if (mounted) setState(() => _isLoadingComments = false);
    }

    // 2. الاستماع اللحظي المستمر لأي تعليق جديد يضيفه مستخدم آخر
    _commentsSubscription?.cancel();
    try {
      _commentsSubscription = Supabase.instance.client
          .from('ad_comments')
          .stream(primaryKey: ['id'])
          .eq('ad_id', _currentAd.id.toString())
          .order('created_at', ascending: true)
          .listen((List<Map<String, dynamic>> data) {
            if (mounted && data.isNotEmpty) {
              setState(() {
                _adComments =
                    data.map((m) => AdCommentItem.fromMap(m)).toList();
              });
            }
          }, onError: (err) {
            debugPrint('Comments Stream Error: $err');
          });
    } catch (e) {
      debugPrint('Stream setup error: $e');
    }
  }

  Future<void> _submitComment() async {
    final text = _commentController.text.trim();
    if (text.isEmpty) return;

    final userName = _manager.currentUserName.isNotEmpty
        ? _manager.currentUserName
        : (_manager.currentUserPhone.isNotEmpty
            ? _manager.currentUserPhone
            : 'مستخدم في السوق');

    final now = DateTime.now();
    _commentController.clear();
    FocusScope.of(context).unfocus();

    // جلب معرف المستخدم الحقيقي من جلسة Supabase لضمان التوافق مع UUID
    final authUser = Supabase.instance.client.auth.currentUser;
    final String? validUserId = authUser?.id;

    // حزمة البيانات النظيفة والمطابقة لقاعدة البيانات
    final Map<String, dynamic> commentPayload = {
      'ad_id': _currentAd.id.toString(),
      'comment_text': text,
      'user_name': userName,
      'created_at': now.toIso8601String(),
    };

    if (validUserId != null) {
      commentPayload['user_id'] = validUserId;
    }

    try {
      final res = await Supabase.instance.client
          .from('ad_comments')
          .insert(commentPayload)
          .select()
          .maybeSingle();

      final savedComment = res != null
          ? AdCommentItem.fromMap(res)
          : AdCommentItem(
              id: 'cmt_${now.millisecondsSinceEpoch}',
              adId: _currentAd.id.toString(),
              userId: validUserId ?? '',
              userName: userName,
              commentText: text,
              createdAt: now,
            );

      if (mounted) {
        setState(() {
          _adComments.add(savedComment);
        });
      }
    } catch (e) {
      debugPrint('Error inserting comment to Supabase: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('⚠️ تعذر إرسال التعليق: $e'),
            backgroundColor: Colors.red.shade800,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  void _zoomIn() {
    setState(() {
      _currentScale = (_currentScale + 0.5).clamp(1.0, 5.0);
      _zoomController.value = Matrix4.identity()..scale(_currentScale);
    });
  }

  void _zoomOut() {
    setState(() {
      _currentScale = (_currentScale - 0.5).clamp(1.0, 5.0);
      _zoomController.value = Matrix4.identity();
    });
  }

  void _resetZoom() {
    setState(() {
      _currentScale = 1.0;
      _zoomController.value = Matrix4.identity();
    });
  }

  // معاينة الصورة الفخمة على كامل أبعاد الشاشة بدون أي انكماش
  void _openFullScreenImage(int index) {
    final images =
        _currentAd.imageUrls.isNotEmpty ? _currentAd.imageUrls : [''];

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black.withOpacity(0.85),
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 26),
              onPressed: () => Navigator.pop(ctx),
            ),
            title: Text(
              'صورة ${index + 1} من ${images.length}',
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
            centerTitle: true,
          ),
          body: SizedBox.expand(
            child: InteractiveViewer(
              panEnabled: true,
              boundaryMargin: const EdgeInsets.all(20),
              minScale: 0.5,
              maxScale: 5.0,
              child: Center(
                child: AppSmartImage(
                  imageUrl: images[index],
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _callSeller() async {
    final phone = _currentAd.contactPhone.isNotEmpty
        ? _currentAd.contactPhone
        : _currentAd.phone;
    final uri = Uri.parse('tel:$phone');
    try {
      if (await canLaunchUrl(uri)) await launchUrl(uri);
    } catch (_) {}
  }

  void _openWhatsapp() async {
    final target = _currentAd.contactWhatsapp.isNotEmpty
        ? _currentAd.contactWhatsapp
        : (_currentAd.whatsapp.isNotEmpty
            ? _currentAd.whatsapp
            : _currentAd.phone);
    final clean = PhoneHelper.formatForWhatsapp(target);
    final msg = Uri.encodeComponent(
      'مرحباً، أنا مهتم بإعلانك "${_currentAd.title}" المعروض على تطبيق سوق سوريا الشامل 2028.',
    );
    final uri = Uri.parse('https://wa.me/$clean?text=$msg');
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (_) {}
  }

  void _openSocialLink(String? url) async {
    if (url == null || url.trim().isEmpty) return;
    try {
      String target = url.trim();
      if (!target.startsWith('http://') && !target.startsWith('https://')) {
        target = 'https://$target';
      }
      final uri = Uri.parse(target);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (_) {}
  }

  // ويدجت شريط روابط السوشيال ميديا الحصري للمعلن المميز
  Widget _buildSellerSocialBar() {
    final hasFb = _currentAd.facebookUrl != null &&
        _currentAd.facebookUrl!.trim().isNotEmpty;
    final hasYt = _currentAd.youtubeUrl != null &&
        _currentAd.youtubeUrl!.trim().isNotEmpty;
    final hasIg = _currentAd.instagramUrl != null &&
        _currentAd.instagramUrl!.trim().isNotEmpty;
    final hasTg = _currentAd.telegramUrl != null &&
        _currentAd.telegramUrl!.trim().isNotEmpty;
    final hasTt =
        _currentAd.tiktokUrl != null && _currentAd.tiktokUrl!.trim().isNotEmpty;

    if (!hasFb && !hasYt && !hasIg && !hasTg && !hasTt) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFD4AF37).withOpacity(0.4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.verified, color: Color(0xFFD4AF37), size: 18),
              SizedBox(width: 6),
              Text(
                'حسابات المعلن المعتمدة وتضمين الفيديو 🔗',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              if (hasYt)
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF0000),
                    foregroundColor: Colors.white,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  icon: const Icon(Icons.play_circle_fill, size: 16),
                  label: const Text('فيديو يوتيوب',
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                  onPressed: () => _openSocialLink(_currentAd.youtubeUrl),
                ),
              if (hasFb)
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1877F2),
                    foregroundColor: Colors.white,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  icon: const Icon(Icons.facebook, size: 16),
                  label: const Text('فيسبوك',
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                  onPressed: () => _openSocialLink(_currentAd.facebookUrl),
                ),
              if (hasIg)
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE1306C),
                    foregroundColor: Colors.white,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  icon: const Icon(Icons.camera_alt, size: 16),
                  label: const Text('إنستغرام',
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                  onPressed: () => _openSocialLink(_currentAd.instagramUrl),
                ),
              if (hasTg)
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF229ED9),
                    foregroundColor: Colors.white,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  icon: const Icon(Icons.send, size: 16),
                  label: const Text('تليجرام',
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                  onPressed: () => _openSocialLink(_currentAd.telegramUrl),
                ),
              if (hasTt)
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF000000),
                    foregroundColor: Colors.cyanAccent,
                    side: const BorderSide(color: Colors.white24),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  icon: const Icon(Icons.music_note, size: 16),
                  label: const Text('تيك توك',
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                  onPressed: () => _openSocialLink(_currentAd.tiktokUrl),
                ),
            ],
          ),
        ],
      ),
    );
  }

  void _openDirectChat() {
    if (!_manager.isLoggedIn) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              '⚠️ خاصية الدردشة والتفاوض متاحة فقط للأعضاء المسجلين! يرجى تسجيل الدخول أولاً.'),
          backgroundColor: Colors.orange,
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => FullChatNegotiationScreen(
          adId: _currentAd.id,
          partnerName: _currentAd.userName.isNotEmpty
              ? _currentAd.userName
              : 'صاحب الإعلان',
          productTitle: _currentAd.title,
          initialPrice: _currentAd.priceUsd ?? _currentAd.priceSyp ?? 0,
        ),
      ),
    );
  }

  void _openWebPreview() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => InAppPostWebPreviewScreen(ad: _currentAd),
      ),
    );
  }

  Future<void> _handleVote(bool isPositive) async {
    if (!_manager.isLoggedIn) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('⚠️ يجب تسجيل الدخول أولاً لتقييم مصداقية المعلن.')),
      );
      return;
    }

    final success = await _manager.voteOnAd(
      adId: _currentAd.id,
      isPositive: isPositive,
    );

    if (!success) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
                '⚠️ لقد قمت بالتقييم مسبقاً على هذا المنشور! التصويت مقفل لكل حساب منعاً للتكرار.'),
            backgroundColor: Colors.orange,
          ),
        );
      }
      return;
    }

    final newLikes = isPositive
        ? _currentAd.sellerPositiveLikes + 1
        : _currentAd.sellerPositiveLikes;
    final newDislikes =
        !isPositive ? _currentAd.sellerDislikes + 1 : _currentAd.sellerDislikes;

    final updatedAd = _currentAd.copyWith(
      sellerPositiveLikes: newLikes,
      sellerDislikes: newDislikes,
    );

    setState(() {
      _currentAd = updatedAd;
    });
    widget.onAdUpdated(updatedAd);

    try {
      await Supabase.instance.client
          .from('ads')
          .update({
            'seller_positive_likes': newLikes,
            'seller_dislikes': newDislikes,
          })
          .eq('id', _currentAd.id)
          .timeout(const Duration(seconds: 10));

      try {
        await Supabase.instance.client.from('ad_votes').insert({
          'ad_id': _currentAd.id,
          'user_id': _manager.currentUserId,
          'is_positive': isPositive,
          'created_at': DateTime.now().toIso8601String(),
        }).timeout(const Duration(seconds: 5));
      } catch (_) {}
    } catch (e) {
      debugPrint('Error updating vote in database: $e');
    }

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isPositive
                ? '👍 شكراً لتقييمك! تم حفظ التقييم الإيجابي بنجاح على السيرفر.'
                : '👎 تم تسجيل تقييمك السلبي بنجاح على السيرفر.',
          ),
          backgroundColor:
              isPositive ? Colors.green.shade800 : Colors.red.shade900,
        ),
      );
    }
  }

  Future<void> _confirmMarkAsSold() async {
    final confirm = await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            backgroundColor: const Color(0xFF0F172A),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            title: const Row(
              children: [
                Icon(Icons.check_circle_outline,
                    color: Color(0xFFDC2626), size: 24),
                SizedBox(width: 8),
                Text('تأكيد تم البيع ✓ SOLD',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            content: const Text(
              'هل تم بيع هذه السلعة بالفعل؟\nسيظهر ختم "تم البيع" لجميع المستخدمين مع عداد تنازلي 5 دقائق، وسيتم حذف المنشور نهائياً من السيرفر والأجهزة بعد انتهاء المدة.',
              style:
                  TextStyle(color: Colors.white70, fontSize: 13, height: 1.5),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child:
                    const Text('إلغاء', style: TextStyle(color: Colors.grey)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFDC2626),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () => Navigator.pop(ctx, true),
                child: const Text('تأكيد ختم البيع',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ) ??
        false;

    if (!confirm) return;
    final willBeSold = !_currentAd.isSold;
    final nowUtc = DateTime.now().toUtc();

    // 1. تحديث الحالة فوراً على السيرفر بتوقيت UTC العالمي الموحد
    try {
      await Supabase.instance.client
          .from('ads')
          .update({
            'is_sold': willBeSold,
            'sold_at': willBeSold ? nowUtc.toIso8601String() : null,
          })
          .eq('id', _currentAd.id)
          .timeout(const Duration(seconds: 8));
    } catch (e) {
      debugPrint('Error updating sold status: $e');
    }

    setState(() {
      _currentAd = _currentAd.copyWith(
        isSold: willBeSold,
        soldAt: willBeSold ? nowUtc : null,
      );
    });
    widget.onAdUpdated(_currentAd);

    if (willBeSold) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              '🤝 تم ختم الإعلان (تم البيع). سيتم حذفه نهائياً من السيرفر بعد 5 دقائق!'),
          backgroundColor: Color(0xFFD4AF37),
          duration: Duration(seconds: 4),
        ),
      );

      _countdownTimer?.cancel();
      // تشغيل مؤقت الحذف النهائي التلقائي من السيرفر بعد 5 دقائق بالضبط (300 ثانية)
      _countdownTimer = Timer(const Duration(minutes: 5), () async {
        final adIdToDelete = _currentAd.id;
        try {
          // حذف تعليقات ومفضلات الإعلان أولاً لضمان عدم وجود عائق في قاعدة البيانات
          try {
            await Supabase.instance.client
                .from('ad_comments')
                .delete()
                .eq('ad_id', adIdToDelete);
            await Supabase.instance.client
                .from('favorites')
                .delete()
                .eq('ad_id', adIdToDelete);
          } catch (_) {}

          // حذف الإعلان نهائياً من جدول Supabase لكي لا يشغل مساحة
          await Supabase.instance.client
              .from('ads')
              .delete()
              .eq('id', adIdToDelete);

          // حذفه من القائمة المحلية للمدير
          _manager.ads.removeWhere((a) => a.id == adIdToDelete);
          _manager.notifyListeners();
          widget.onAdDeleted(adIdToDelete);

          debugPrint(
              '🗑️ تم حذف الإعلان المباع من السيرفر نهائياً: $adIdToDelete');

          if (mounted) {
            Navigator.pop(context); // إغلاق صفحة الإعلان المحذوف
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('✅ تم حذف الإعلان المباع من السيرفر نهائياً.'),
                backgroundColor: Colors.green,
              ),
            );
          }
        } catch (e) {
          debugPrint('خطأ أثناء الحذف التلقائي من السيرفر: $e');
        }
      });
    } else {
      _countdownTimer?.cancel();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('تم إلغاء ختم البيع وإعادة الإعلان للعمل بنجاح.'),
          backgroundColor: Colors.blueGrey,
        ),
      );
    }
  }
