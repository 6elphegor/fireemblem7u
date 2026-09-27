	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08047E84
sub_08047E84: @ 0x08047E84
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	adds r6, r1, #0
	mov r8, r2
	mov sb, r3
	ldr r0, _08047F08 @ =0x081C4878
	ldr r1, _08047F0C @ =0x02020140
	bl Decompress
	movs r4, #0
	cmp r4, r6
	bge _08047EC8
	ldr r5, _08047F10 @ =0x06014100
_08047EA4:
	adds r0, r4, #0
	adds r1, r6, #0
	bl __modsi3
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #5
	ldr r1, _08047F0C @ =0x02020140
	adds r0, r0, r1
	adds r1, r5, #0
	movs r2, #1
	movs r3, #2
	bl sub_08047CB8
	adds r5, #0x20
	adds r4, #1
	cmp r4, r6
	blt _08047EA4
_08047EC8:
	ldr r0, [sp, #0x1c]
	lsls r0, r0, #5
	ldr r1, _08047F14 @ =0x081C8004
	adds r0, r0, r1
	movs r1, #0xb8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, _08047F18 @ =0x08B9A3D0
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	ldr r1, [sp, #0x20]
	bl Proc_Start
	mov r1, r8
	str r1, [r0, #0x2c]
	str r1, [r0, #0x34]
	mov r1, sb
	str r1, [r0, #0x30]
	str r1, [r0, #0x38]
	str r6, [r0, #0x3c]
	movs r1, #0
	str r1, [r0, #0x40]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047F08: .4byte 0x081C4878
_08047F0C: .4byte 0x02020140
_08047F10: .4byte 0x06014100
_08047F14: .4byte 0x081C8004
_08047F18: .4byte 0x08B9A3D0
