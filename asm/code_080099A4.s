	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080099A4
sub_080099A4: @ 0x080099A4
	push {r4, r5, r6, lr}
	sub sp, #0x1c
	adds r6, r0, #0
	mov r1, sp
	ldr r0, _08009A08 @ =0x08193DDC
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	adds r5, r6, #0
	adds r5, #0x64
	ldrh r1, [r5]
	adds r2, r1, #1
	strh r2, [r5]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08009A00
	lsls r0, r2, #0x10
	asrs r0, r0, #0x11
	lsls r0, r0, #2
	add r0, sp
	ldr r4, [r0]
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, _08009A0C @ =0x06000200
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldrh r5, [r5]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x11
	adds r0, #1
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	cmp r0, #0
	bne _08009A00
	adds r0, r6, #0
	bl Proc_Break
_08009A00:
	add sp, #0x1c
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08009A08: .4byte 0x08193DDC
_08009A0C: .4byte 0x06000200
