	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B2FCC
sub_080B2FCC: @ 0x080B2FCC
	push {r4, r5, lr}
	sub sp, #8
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp]
	ldr r4, _080B3024 @ =0x0200000C
	ldr r2, _080B3028 @ =0x01000200
	mov r0, sp
	adds r1, r4, #0
	bl CpuFastSet
	movs r5, #0
	str r5, [sp, #4]
	add r0, sp, #4
	ldr r1, _080B302C @ =0x06001000
	ldr r2, _080B3030 @ =0x01001400
	bl CpuFastSet
	ldr r0, _080B3034 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r4, r1
	strh r5, [r0]
	adds r1, #2
	adds r0, r4, r1
	strh r5, [r0]
	ldr r0, _080B3038 @ =0x00000804
	adds r4, r4, r0
	strh r5, [r4]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #4
	bl EnableBgSync
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B3024: .4byte 0x0200000C
_080B3028: .4byte 0x01000200
_080B302C: .4byte 0x06001000
_080B3030: .4byte 0x01001400
_080B3034: .4byte 0x02023C60
_080B3038: .4byte 0x00000804
