	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08084DE4
sub_08084DE4: @ 0x08084DE4
	push {lr}
	ldr r1, _08084E1C @ =0x08CC2B94
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x18
	cmp r0, #0
	bge _08084E02
	movs r1, #0
_08084E02:
	ldr r0, _08084E20 @ =0x020034BC
	lsls r1, r1, #1
	ldr r2, _08084E24 @ =0x02022FA0
	adds r1, r1, r2
	movs r2, #6
	movs r3, #7
	bl TmCopyRect_thm
	movs r0, #3
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_08084E1C: .4byte 0x08CC2B94
_08084E20: .4byte 0x020034BC
_08084E24: .4byte 0x02022FA0
