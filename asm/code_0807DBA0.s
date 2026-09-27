	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807DBA0
sub_0807DBA0: @ 0x0807DBA0
	push {r4, r5, lr}
	sub sp, #0x14
	ldr r1, _0807DBD8 @ =0x083FC924
	mov r0, sp
	movs r2, #0x14
	bl memcpy
	movs r3, #0
	ldr r0, _0807DBDC @ =0x0202E3DC
	ldr r4, [r0]
	mov r2, sp
	movs r5, #0xc0
_0807DBB8:
	movs r0, #1
	ldrsb r0, [r2, r0]
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807DBE0
	ands r0, r5
	cmp r0, #0
	bne _0807DBE0
	movs r0, #1
	b _0807DBEA
	.align 2, 0
_0807DBD8: .4byte 0x083FC924
_0807DBDC: .4byte 0x0202E3DC
_0807DBE0:
	adds r2, #2
	adds r3, #1
	cmp r3, #8
	ble _0807DBB8
	movs r0, #0
_0807DBEA:
	add sp, #0x14
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
