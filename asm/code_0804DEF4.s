	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804DEF4
sub_0804DEF4: @ 0x0804DEF4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r0, [r7, #0x5c]
	mov r8, r0
	ldr r1, [r7, #0x60]
	mov sb, r1
	ldr r4, _0804DF50 @ =0x081D7EE4
	movs r2, #0x2c
	ldrsh r0, [r7, r2]
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0804DF5C
	mov r0, r8
	bl GetAnimPosition
	ldr r5, _0804DF54 @ =0x02000028
	lsls r0, r0, #1
	adds r0, r0, r5
	ldr r4, _0804DF58 @ =0x0201FB00
	ldrh r0, [r0]
	ldrh r1, [r4]
	subs r0, r0, r1
	mov r2, r8
	strh r0, [r2, #2]
	ldr r0, [r7, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	ldrh r4, [r4]
	subs r0, r0, r4
	mov r1, sb
	strh r0, [r1, #2]
	adds r0, r7, #0
	bl Proc_Break
	b _0804DFBC
	.align 2, 0
_0804DF50: .4byte 0x081D7EE4
_0804DF54: .4byte 0x02000028
_0804DF58: .4byte 0x0201FB00
_0804DF5C:
	mov r0, r8
	bl GetAnimPosition
	cmp r0, #1
	bne _0804DF78
	movs r2, #0x2c
	ldrsh r0, [r7, r2]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	b _0804DF82
_0804DF78:
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r4, [r0]
_0804DF82:
	ldr r0, [r7, #0x5c]
	bl GetAnimPosition
	ldr r6, _0804DFC8 @ =0x02000028
	lsls r0, r0, #1
	adds r0, r0, r6
	ldr r5, _0804DFCC @ =0x0201FB00
	ldr r1, [r5]
	ldrh r0, [r0]
	subs r1, r0, r1
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r1, r4, r1
	mov r2, r8
	strh r1, [r2, #2]
	ldr r0, [r7, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r6
	ldr r1, [r5]
	ldrh r0, [r0]
	subs r1, r0, r1
	adds r4, r4, r1
	mov r0, sb
	strh r4, [r0, #2]
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
_0804DFBC:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804DFC8: .4byte 0x02000028
_0804DFCC: .4byte 0x0201FB00
