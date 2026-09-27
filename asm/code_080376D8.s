	.include "macro.inc"

	.syntax unified

	thumb_func_start AiScript_Exec
AiScript_Exec: @ 0x080376D8
	push {r4, lr}
	sub sp, #0x70
	adds r4, r0, #0
	ldr r1, _08037700 @ =0x081D3678
	mov r0, sp
	movs r2, #0x70
	bl memcpy
	ldr r1, _08037704 @ =0x030013B8
	ldr r0, [r1]
	ldrb r0, [r0]
	cmp r0, #0x1b
	bls _08037714
	ldr r0, _08037708 @ =0x030013B4
	ldr r0, [r0]
	cmp r0, #0
	bne _08037710
	ldr r0, _0803770C @ =0x08B970A4
	b _08037712
	.align 2, 0
_08037700: .4byte 0x081D3678
_08037704: .4byte 0x030013B8
_08037708: .4byte 0x030013B4
_0803770C: .4byte 0x08B970A4
_08037710:
	ldr r0, _08037738 @ =0x08B970B4
_08037712:
	str r0, [r1]
_08037714:
	ldr r1, _0803773C @ =0x0203A8EC
	ldr r0, _08037740 @ =0x030013B8
	ldr r2, [r0]
	ldrb r0, [r2, #2]
	adds r1, #0x7e
	strb r0, [r1]
	ldrb r2, [r2]
	lsls r0, r2, #2
	add r0, sp
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	add sp, #0x70
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08037738: .4byte 0x08B970B4
_0803773C: .4byte 0x0203A8EC
_08037740: .4byte 0x030013B8
