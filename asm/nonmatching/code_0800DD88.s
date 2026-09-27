	.include "macro.inc"

	.syntax unified

	thumb_func_start EventFlashCursorWait
EventFlashCursorWait: @ 0x0800DD88
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800DDA8
	ldr r0, _0800DDA4 @ =0x08B91A38
	bl Proc_EndEach
	movs r0, #0
	b _0800DDB2
	.align 2, 0
_0800DDA4: .4byte 0x08B91A38
_0800DDA8:
	ldr r0, _0800DDBC @ =0x08B91A38
	bl Proc_Find
	cmp r0, #0
	bne _0800DDB4
_0800DDB2:
	str r0, [r4, #0x40]
_0800DDB4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800DDBC: .4byte 0x08B91A38
