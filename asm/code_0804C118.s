	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804C118
sub_0804C118: @ 0x0804C118
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r7, r1, #0
	movs r6, #0
	adds r5, r7, #0
_0804C124:
	movs r0, #0xf
	ldrh r1, [r4]
	cmp r1, #0xff
	beq _0804C12E
	ldrh r0, [r4]
_0804C12E:
	lsls r0, r0, #5
	ldr r1, _0804C160 @ =0x081D93B0
	adds r0, r0, r1
	adds r1, r5, #0
	movs r2, #8
	bl CpuFastSet
	adds r4, #2
	adds r5, #0x20
	adds r6, #1
	cmp r6, #0xa
	bls _0804C124
	movs r0, #0
	str r0, [sp]
	movs r0, #0xc0
	lsls r0, r0, #1
	adds r1, r7, r0
	ldr r2, _0804C164 @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C160: .4byte 0x081D93B0
_0804C164: .4byte 0x01000008
