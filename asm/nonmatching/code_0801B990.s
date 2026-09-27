	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801B990
sub_0801B990: @ 0x0801B990
	push {lr}
	sub sp, #0x14
	ldr r0, [r0, #0x44]
	adds r0, #0x3c
	movs r1, #0
	strb r1, [r0]
	movs r0, #1
	bl EnableBgSync
	add r0, sp, #4
	movs r1, #3
	bl ReadSaveBlockInfo
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0801B9C0
	ldr r0, [sp, #0x10]
	lsrs r1, r0, #0x10
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	cmp r0, #0
	beq _0801B9E0
_0801B9C0:
	ldr r0, _0801B9DC @ =0x00000103
	str r0, [sp]
	movs r0, #0
	movs r1, #0xb7
	movs r2, #0x20
	movs r3, #0x50
	bl StartFace
	movs r0, #0x81
	lsls r0, r0, #1
	str r0, [sp]
	movs r0, #1
	movs r1, #0xb6
	b _0801B9FA
	.align 2, 0
_0801B9DC: .4byte 0x00000103
_0801B9E0:
	ldr r0, _0801BA0C @ =0x00000103
	str r0, [sp]
	movs r0, #0
	movs r1, #0xb4
	movs r2, #0x20
	movs r3, #0x50
	bl StartFace
	movs r0, #0x81
	lsls r0, r0, #1
	str r0, [sp]
	movs r0, #1
	movs r1, #0xb2
_0801B9FA:
	movs r2, #0xd0
	movs r3, #0x50
	bl StartFace
	movs r0, #0
	add sp, #0x14
	pop {r1}
	bx r1
	.align 2, 0
_0801BA0C: .4byte 0x00000103
