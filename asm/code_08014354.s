	.include "macro.inc"

	.syntax unified

	thumb_func_start FadeCore_Tick
FadeCore_Tick: @ 0x08014354
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	ldr r2, [r4, #0x54]
	adds r1, r0, r2
	str r1, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	adds r0, r0, r2
	str r0, [r4, #0x5c]
	cmp r1, #0xf
	bgt _08014372
	cmp r0, r2
	beq _08014378
_0801436E:
	movs r0, #1
	b _08014390
_08014372:
	adds r0, r1, #0
	subs r0, #0x10
	str r0, [r4, #0x58]
_08014378:
	bl ColorFadeTick_thm
	ldr r1, _08014398 @ =0x02022860
	movs r0, #0
	strh r0, [r1]
	bl EnablePalSync
	ldr r1, [r4, #0x5c]
	ldr r0, _0801439C @ =0x000001FF
	cmp r1, r0
	ble _0801436E
	movs r0, #0
_08014390:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08014398: .4byte 0x02022860
_0801439C: .4byte 0x000001FF
