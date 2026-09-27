	.include "macro.inc"

	.syntax unified

	thumb_func_start ShinningEventCursor
ShinningEventCursor: @ 0x0807A4DC
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r3, r2, #0
	movs r0, #8
	str r0, [sp]
	movs r0, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl Interpolate
	adds r5, r0, #0
	ldr r0, _0807A520 @ =0x0841E3B8
	ldr r4, _0807A524 @ =0x02022AA0
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, _0807A528 @ =0xFFFFFDC0
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x12
	movs r2, #1
	adds r3, r5, #0
	bl EfxPalWhiteInOut
	bl EnablePalSync
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807A520: .4byte 0x0841E3B8
_0807A524: .4byte 0x02022AA0
_0807A528: .4byte 0xFFFFFDC0
