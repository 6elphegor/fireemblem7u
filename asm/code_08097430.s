	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08097430
sub_08097430: @ 0x08097430
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809744C
	ldr r0, _08097468 @ =0x08CC3BDC
	bl Proc_Find
	adds r1, r4, #0
	adds r1, #0x35
	ldrb r1, [r1]
	adds r0, #0x32
	strb r1, [r0]
_0809744C:
	bl sub_080A9D08
	adds r0, r4, #0
	bl EndAllProcChildren
	bl EndMuralBackground_
	movs r0, #0
	bl SetOnHBlankA
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097468: .4byte 0x08CC3BDC
