	.include "macro.inc"

	.syntax unified

	thumb_func_start LoadModeSelectChapterGfx
LoadModeSelectChapterGfx: @ 0x080A77F8
	push {r4, r5, lr}
	sub sp, #0x30
	adds r4, r0, #0
	mov r1, sp
	ldr r0, _080A784C @ =0x08418DC0
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	lsls r4, r4, #4
	mov r1, sp
	adds r0, r1, r4
	ldr r0, [r0]
	ldr r1, _080A7850 @ =0x060102C0
	bl Decompress
	add r0, sp, #4
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _080A7854 @ =0x060106C0
	bl Decompress
	add r0, sp, #8
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _080A7858 @ =0x06010AC0
	bl Decompress
	add r0, sp, #0xc
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _080A785C @ =0x06010EC0
	bl Decompress
	add sp, #0x30
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A784C: .4byte 0x08418DC0
_080A7850: .4byte 0x060102C0
_080A7854: .4byte 0x060106C0
_080A7858: .4byte 0x06010AC0
_080A785C: .4byte 0x06010EC0
