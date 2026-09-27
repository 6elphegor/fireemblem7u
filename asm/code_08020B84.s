	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08020B84
sub_08020B84: @ 0x08020B84
	push {r4, r5, r6, lr}
	sub sp, #0x38
	adds r6, r0, #0
	ldr r1, _08020BC0 @ =0x081C3C30
	mov r0, sp
	movs r2, #0x38
	bl memcpy
	adds r0, r6, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0xe
	add r0, sp
	ldrb r4, [r0]
	ldrb r5, [r0, #1]
	cmp r4, #0xff
	bne _08020BC4
	adds r0, r6, #0
	bl Proc_Break
	b _08020BEA
	.align 2, 0
_08020BC0: .4byte 0x081C3C30
_08020BC4:
	cmp r4, #0
	bne _08020BD0
	cmp r5, #0x10
	bne _08020BD0
	bl RefreshUnitSprites
_08020BD0:
	lsls r0, r5, #5
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r1, _08020BF4 @ =0x0200323C
	adds r0, r0, r1
	ldr r1, _08020BF8 @ =0x02022C60
	movs r2, #6
	movs r3, #8
	bl TmCopyRect_thm
	movs r0, #1
	bl EnableBgSync
_08020BEA:
	add sp, #0x38
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08020BF4: .4byte 0x0200323C
_08020BF8: .4byte 0x02022C60
