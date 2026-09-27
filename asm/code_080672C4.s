	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxChapterMapFadeOUT
EfxChapterMapFadeOUT: @ 0x080672C4
	push {r4, lr}
	adds r4, r0, #0
	bl UnpackChapterMapPalette
	ldr r0, _080672E4 @ =0x02022860
	movs r1, #6
	movs r2, #0xa
	adds r3, r4, #0
	bl EfxPalBlackInOut
	bl EnablePalSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080672E4: .4byte 0x02022860
