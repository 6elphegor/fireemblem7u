	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08081634
sub_08081634: @ 0x08081634
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08081650 @ =0x0200310C
	ldr r0, [r0, #0xc]
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08081658
	adds r1, r4, #0
	adds r1, #0x4c
	ldr r0, _08081654 @ =0x00000265
	b _08081660
	.align 2, 0
_08081650: .4byte 0x0200310C
_08081654: .4byte 0x00000265
_08081658:
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0x99
	lsls r0, r0, #2
_08081660:
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
