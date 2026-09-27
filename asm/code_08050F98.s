	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08050F98
sub_08050F98: @ 0x08050F98
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _08050FBC @ =0x0203E00A
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08050FB2
	bl CheckInEkrDragon
	adds r5, r0, #0
	cmp r5, #0
	beq _08050FC0
_08050FB2:
	adds r0, r4, #0
	bl Proc_Break
	b _08050FEC
	.align 2, 0
_08050FBC: .4byte 0x0203E00A
_08050FC0:
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #4
	bl Interpolate
	bl EfxChapterMapFadeOUT
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _08050FEC
	strh r5, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
_08050FEC:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
