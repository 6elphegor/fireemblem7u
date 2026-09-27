	.include "macro.inc"

	.syntax unified

	thumb_func_start BmVSync_TsPalAnim
BmVSync_TsPalAnim: @ 0x0802D2D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	cmp r0, #0
	beq _0802D318
	ldrh r1, [r4, #0x36]
	movs r2, #0x36
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _0802D2EE
	subs r0, r1, #1
	strh r0, [r4, #0x36]
	b _0802D318
_0802D2EE:
	ldr r3, [r4, #0x3c]
	ldrb r0, [r3, #4]
	strh r0, [r4, #0x36]
	ldr r0, [r3]
	ldrb r2, [r3, #6]
	lsls r1, r2, #1
	ldr r2, _0802D320 @ =0x02022920
	adds r1, r1, r2
	ldrb r2, [r3, #5]
	bl CpuSet
	bl EnablePalSync
	ldr r0, [r4, #0x3c]
	adds r0, #8
	str r0, [r4, #0x3c]
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _0802D318
	ldr r0, [r4, #0x38]
	str r0, [r4, #0x3c]
_0802D318:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802D320: .4byte 0x02022920
