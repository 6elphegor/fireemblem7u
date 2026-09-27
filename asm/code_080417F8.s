	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080417F8
sub_080417F8: @ 0x080417F8
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	mov r8, r0
	mov sb, r1
	adds r4, r2, #0
	adds r6, r3, #0
	ldr r5, [sp, #0x18]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	movs r1, #8
	movs r2, #0
	mov r3, sb
	bl Text_InsertDrawString
	mov r0, r8
	movs r1, #0x60
	movs r2, #2
	adds r3, r6, #0
	bl SioDrawNumber
	ldr r3, _08041874 @ =0x081D53C8
	mov r0, r8
	movs r1, #0x68
	movs r2, #0
	bl Text_InsertDrawString
	ldr r0, _08041878 @ =0x081D539C
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	bl DecodeMsg
	adds r3, r0, #0
	mov r0, r8
	movs r1, #0x88
	movs r2, #2
	bl Text_InsertDrawString
	ldr r0, _0804187C @ =0x081D53B0
	lsls r5, r5, #2
	adds r5, r5, r0
	ldr r0, [r5]
	bl DecodeMsg
	adds r3, r0, #0
	mov r0, r8
	movs r1, #0xa2
	movs r2, #0
	bl Text_InsertDrawString
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08041874: .4byte 0x081D53C8
_08041878: .4byte 0x081D539C
_0804187C: .4byte 0x081D53B0
