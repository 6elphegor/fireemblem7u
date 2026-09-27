	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSysBrownBox
StartSysBrownBox: @ 0x080A9B74
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	adds r4, r1, #0
	mov r8, r2
	adds r5, r3, #0
	ldr r6, [sp, #0x1c]
	ldr r7, [sp, #0x20]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	bl EndSysBrownBox
	ldr r0, _080A9BE4 @ =0x08CE4C18
	adds r1, r7, #0
	bl Proc_Start
	adds r7, r0, #0
	ldr r0, _080A9BE8 @ =0x0840F238
	ldr r2, _080A9BEC @ =0x06010000
	adds r1, r4, r2
	bl Decompress
	ldr r0, _080A9BF0 @ =0x0840624C
	mov r1, r8
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	lsls r4, r4, #0xf
	lsrs r4, r4, #0x14
	movs r0, #0xf
	mov r1, r8
	ands r0, r1
	lsls r0, r0, #0xc
	adds r4, r4, r0
	adds r5, r5, r4
	adds r0, r7, #0
	adds r0, #0x4c
	strh r5, [r0]
	adds r0, #2
	strh r6, [r0]
	adds r0, #2
	mov r2, sb
	strb r2, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A9BE4: .4byte 0x08CE4C18
_080A9BE8: .4byte 0x0840F238
_080A9BEC: .4byte 0x06010000
_080A9BF0: .4byte 0x0840624C
