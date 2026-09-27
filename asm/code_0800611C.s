	.include "macro.inc"

	.syntax unified

	thumb_func_start GetSpecialCharChr
GetSpecialCharChr: @ 0x0800611C
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	ldr r1, _08006138 @ =0x02028D78
_08006124:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0800613C
	adds r0, r1, #0
	adds r1, r3, #0
	bl sub_080060E0
	b _08006156
	.align 2, 0
_08006138: .4byte 0x02028D78
_0800613C:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, r3
	bne _08006152
	movs r0, #1
	ldrsb r0, [r1, r0]
	cmp r0, r2
	bne _08006152
	movs r2, #2
	ldrsh r0, [r1, r2]
	b _08006156
_08006152:
	adds r1, #4
	b _08006124
_08006156:
	pop {r1}
	bx r1
	.align 2, 0
