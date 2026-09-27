	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08020568
sub_08020568: @ 0x08020568
	push {r4, r5, r6, lr}
	sub sp, #0x34
	adds r6, r0, #0
	ldr r1, _080205A4 @ =0x081C3BC4
	mov r0, sp
	movs r2, #0x34
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
	bne _080205A8
	adds r0, r6, #0
	bl Proc_Break
	b _080205CE
	.align 2, 0
_080205A4: .4byte 0x081C3BC4
_080205A8:
	cmp r4, #0x18
	bne _080205B4
	cmp r5, #9
	bne _080205B4
	bl RefreshUnitSprites
_080205B4:
	lsls r0, r5, #5
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r1, _080205D8 @ =0x0200323C
	adds r0, r0, r1
	ldr r1, _080205DC @ =0x02022C60
	movs r2, #8
	movs r3, #9
	bl TmCopyRect_thm
	movs r0, #1
	bl EnableBgSync
_080205CE:
	add sp, #0x34
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080205D8: .4byte 0x0200323C
_080205DC: .4byte 0x02022C60
