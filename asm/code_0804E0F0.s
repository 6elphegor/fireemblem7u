	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804E0F0
sub_0804E0F0: @ 0x0804E0F0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl CheckEkrWindowAppearUnexist
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804E14E
	bl EnableEkrGauge
	bl AsyncEkrDispUP
	movs r0, #0
	str r0, [sp]
	ldr r1, _0804E158 @ =0x02022C60
	ldr r2, _0804E15C @ =0x01000200
	mov r0, sp
	bl CpuFastSet
	ldr r0, _0804E160 @ =0x02000038
	ldrh r1, [r0]
	ldrh r2, [r0, #2]
	movs r0, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	bl EnableBgSync
	bl EkrGauge_0804CC38
	ldr r4, _0804E164 @ =0x0203E09C
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	adds r0, r0, r4
	ldrb r0, [r0]
	bl DisplayDefeatTalkForPid
	adds r0, r5, #0
	bl Proc_Break
_0804E14E:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804E158: .4byte 0x02022C60
_0804E15C: .4byte 0x01000200
_0804E160: .4byte 0x02000038
_0804E164: .4byte 0x0203E09C
