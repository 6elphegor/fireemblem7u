	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08084D90
sub_08084D90: @ 0x08084D90
	push {lr}
	ldr r1, _08084DD8 @ =0x08CC2B94
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r1, r0, r1
	movs r0, #2
	ldrsb r0, [r1, r0]
	movs r2, #0x12
	cmp r0, #0
	bge _08084DAC
	movs r2, #0
_08084DAC:
	movs r0, #3
	ldrsb r0, [r1, r0]
	movs r1, #0xe
	cmp r0, #0
	bge _08084DB8
	movs r1, #0
_08084DB8:
	ldr r0, _08084DDC @ =0x0200323C
	lsls r1, r1, #5
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _08084DE0 @ =0x02022C60
	adds r1, r1, r2
	movs r2, #0xc
	movs r3, #6
	bl TmCopyRect_thm
	movs r0, #3
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_08084DD8: .4byte 0x08CC2B94
_08084DDC: .4byte 0x0200323C
_08084DE0: .4byte 0x02022C60
