	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08067CC4
sub_08067CC4: @ 0x08067CC4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, _08067D04 @ =0x0203E05E
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r6, [r0, r1]
	adds r0, r5, #0
	bl GetAnimPosition
	lsls r1, r6, #1
	adds r6, r1, r0
	adds r0, r6, #0
	bl GetEfxHp
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r6, #2
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r4, r0
	beq _08067D0C
	cmp r0, #0
	beq _08067D08
	movs r0, #0
	b _08067D0E
	.align 2, 0
_08067D04: .4byte 0x0203E05E
_08067D08:
	movs r0, #1
	b _08067D0E
_08067D0C:
	movs r0, #2
_08067D0E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
