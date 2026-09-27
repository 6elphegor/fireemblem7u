	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080060E0
sub_080060E0: @ 0x080060E0
	push {r4, r5, lr}
	adds r5, r0, #0
	strb r1, [r5]
	strb r2, [r5, #1]
	ldr r0, _08006114 @ =0x02028D70
	ldr r3, [r0]
	ldrh r4, [r3, #0x12]
	adds r0, r4, #1
	strh r0, [r3, #0x12]
	strh r4, [r5, #2]
	movs r0, #0xff
	strb r0, [r5, #4]
	movs r3, #2
	ldrsh r0, [r5, r3]
	ldr r3, _08006118 @ =0x08B901B0
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl sub_08006084
	movs r1, #2
	ldrsh r0, [r5, r1]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08006114: .4byte 0x02028D70
_08006118: .4byte 0x08B901B0
