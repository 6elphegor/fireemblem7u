	.include "macro.inc"

	.syntax unified

	thumb_func_start SetMenuOverride
SetMenuOverride: @ 0x0804AC1C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r3, _0804AC24 @ =0x03001458
	b _0804AC2A
	.align 2, 0
_0804AC24: .4byte 0x03001458
_0804AC28:
	adds r3, #8
_0804AC2A:
	movs r5, #2
	ldrsh r0, [r3, r5]
	cmp r0, #0
	beq _0804AC3E
	cmp r0, r1
	bne _0804AC28
	movs r5, #0
	ldrsh r0, [r3, r5]
	cmp r0, r4
	bne _0804AC28
_0804AC3E:
	strh r4, [r3]
	strh r1, [r3, #2]
	str r2, [r3, #4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
