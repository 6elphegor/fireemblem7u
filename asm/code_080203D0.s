	.include "macro.inc"

	.syntax unified

	thumb_func_start GameOverScreen_BeginFadeOut
GameOverScreen_BeginFadeOut: @ 0x080203D0
	push {r4, r5, lr}
	bl ColorFadeInit
	ldr r4, _08020404 @ =0x02022860
	movs r5, #1
	rsbs r5, r5, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	adds r3, r5, #0
	bl MaybeSmoothChangeSomePal
	adds r4, #0x80
	adds r0, r4, #0
	movs r1, #4
	movs r2, #1
	adds r3, r5, #0
	bl MaybeSmoothChangeSomePal
	movs r0, #4
	bl FadeBgmOut
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08020404: .4byte 0x02022860
