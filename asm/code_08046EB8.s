	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08046EB8
sub_08046EB8: @ 0x08046EB8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _08046EFC @ =0x06015000
	movs r1, #6
	bl LoadHelpBoxGfx
	movs r2, #0xf5
	lsls r2, r2, #2
	movs r0, #0x40
	movs r1, #0x38
	bl StartHelpBoxExt_Unk
	movs r4, #0
	ldr r6, _08046F00 @ =0x0203DCA6
_08046ED4:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_0803CD1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08046EEC
	adds r0, r4, r6
	ldrb r0, [r0]
	cmp r0, #0
	beq _08046EEC
	str r4, [r5, #0x58]
_08046EEC:
	adds r4, #1
	cmp r4, #3
	ble _08046ED4
	movs r0, #0
	str r0, [r5, #0x5c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08046EFC: .4byte 0x06015000
_08046F00: .4byte 0x0203DCA6
