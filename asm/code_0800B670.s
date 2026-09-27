	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_BackgroundMore
EvtCmd_BackgroundMore: @ 0x0800B670
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldrh r5, [r0, #2]
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800B68A
	movs r0, #0
	b _0800B6AC
_0800B68A:
	adds r4, r2, #0
	adds r4, #0x4c
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800B6A2
	bl LockBmDisplay
	bl LockMus
_0800B6A2:
	adds r0, r5, #0
	bl DisplayBackgroundNoClear
	strb r5, [r4]
	movs r0, #2
_0800B6AC:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
