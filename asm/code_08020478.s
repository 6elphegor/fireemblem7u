	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08020478
sub_08020478: @ 0x08020478
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _0802048C
	ldr r0, _08020488 @ =0x08B93B1C
	bl Proc_StartBlocking
	b _08020494
	.align 2, 0
_08020488: .4byte 0x08B93B1C
_0802048C:
	ldr r0, _08020498 @ =0x08B93B1C
	movs r1, #3
	bl Proc_Start
_08020494:
	pop {r0}
	bx r0
	.align 2, 0
_08020498: .4byte 0x08B93B1C
